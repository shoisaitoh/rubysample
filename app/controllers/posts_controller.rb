class PostsController < ApplicationController
  def index
    @posts = Post.all.as_json
    render json: @posts
  end

  def show
    @post = Post.find(params[:id]).as_json
    render json: @post
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Post not found' }, status: :not_found
  end
end