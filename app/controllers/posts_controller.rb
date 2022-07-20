class PostsController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid, with: :invalid_post_added
  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def invalid_post_added(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

end
