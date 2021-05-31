class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :create]
  

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    url = params[:micropost][:youtube_url]
    url = url.last(11)
    @micropost.youtube_url = url

    if @micropost.save
      flash[:success] = "投稿成功しました!!"
      redirect_to root_url
    else
      flash[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def show
  end

  def edit

  end

  def index
    @microposts = Micropost.all.order(id: "DESC")
  end

  def update
    if micropost.update(micropost_params)
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    micropost = Micropost.find(params[:id])
    micropost.destroy
    redirect_to root_url
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content, :youtube_url, :name )
    end

    def set_micropost
      @micropost = Micropost.find(params[:id])
    end
end
