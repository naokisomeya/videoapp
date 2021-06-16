class LikesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @like = current_user.likes.create(micropost_id: params[:micropost_id])
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @like = current_user.likes.find_by(micropost_id: @micropost.id)
    @like.destroy
  end
end
