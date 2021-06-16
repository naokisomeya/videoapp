class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = 'コメントに成功しました!!'
      redirect_to micropost_path(@comment.micropost)
    else
      flash[:alert] = 'コメントに失敗しました'
      @micropost = @comment.micropost
      @comments = @micropost.comments.includes(:user)
      render 'microposts/show'
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id], micropost_id: params[:micropost_id])
    comment.destroy
    flash[:notice] = 'コメントを削除しました'
    redirect_to micropost_path(comment.micropost)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content).merge(user_id: current_user.id, micropost_id: params[:micropost_id])
  end
end
