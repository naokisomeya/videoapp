class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[show edit update]
  before_action :authenticate_user!, only: %i[new edit destroy create show index]

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.user_id = current_user.id
    url = params[:micropost][:youtube_url]
    url = url.last(11)
    @micropost.youtube_url = url

    if @micropost.save
      flash[:notice] = '投稿に成功しました!!'
      redirect_to microposts_path(@micropost)
    else
      flash[:error] = '投稿に失敗しました' 
      render :new
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
    @comment = Comment.new
    @comments = @micropost.comments.includes(:user)
  end

  def edit
    if @micropost.user != current_user
      flash[:alert] = '不正なアクセスです'
      redirect_to microposts_path
    end
  end

  def index
    @microposts = Micropost.page(params[:page]).per(12).order('updated_at DESC')
  end

  def update
    if @micropost.update(micropost_params)
      flash[:notice] = '更新しました'
      redirect_to micropost_path(@micropost)
    else
      render :edit
    end
  end

  def destroy
    micropost = Micropost.find(params[:id])
    micropost.destroy
    flash[:notice] = '削除しました'
    redirect_to microposts_path(@micropost)
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :youtube_url, :name)
  end

  def set_micropost
    @micropost = Micropost.find(params[:id])
  end
end
