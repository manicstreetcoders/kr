class CommentsController < ApplicationController
  protect_from_forgery
  before_filter :autenticate_user!
  
  def create
    @post = Post.find(params[:id])
    @comment = Comment.build_from(@post, current_user.id, params[:comment])
    @comment.save
    redirect :action => :show, :id => @post
  end 

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.destroy
    end
    redirect_to post_path(@post)
  end
end
