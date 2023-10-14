class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.create(user: current_user, post: @post)

    if @like.persisted?
      flash[:notice] = 'You liked this post!'
      redirect_to user_post_path(current_user, @post)
    else
      flash[:alert] = 'Something went wrong!'
      render :new
    end
  end
end
