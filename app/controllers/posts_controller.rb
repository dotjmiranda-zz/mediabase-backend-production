class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)

    render json: @posts
  end

  def index_category
    @posts = Post.all.where(:category_id => params[:id])

    render json: @posts
  end

  def index_media
    @posts = Post.all.where(:media_id => params[:id])

    render json: @posts
  end

  def show
    @post = Post.find(params[:id])

    render json: @post, include: ["comments"]
  end

  def create
    @user = User.find(params[:user_id])

    @post = Post.create!(
        user_id: params[:user_id],
        username: params[:username],
        title: params[:title],
        content: params[:content],
        category_id: params[:id],
        media_id: params[:media_id]
    )
    User.find(params[:user_id]).increment!("comments_count", 1)

    render json: @post
  end

  def update
    @post = Post.find(params[:post][:id]).update!(
        title: params[:post][:title],
        content: params[:post][:content]
    )
  end

  def destroy
    Post.find(params[:id]).destroy!
  end
end