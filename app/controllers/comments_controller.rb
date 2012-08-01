class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @comment = Comment.build_from(@post, current_user.id, params[:comment])
    @comment.save
    redirect :action => :show, :id => @post
  end 

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
