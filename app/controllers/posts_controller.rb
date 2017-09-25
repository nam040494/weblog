class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_post, except: %i(index new create)

  def index
    @posts = Post.order(:created_at).page(params[:page])
      .per Settings.post.size
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:notice] = t ".success"
      redirect_to post_path @post
    else
      flash[:alert] = t ".error"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes post_params
      flash[:notice] = t ".success"
      redirect_to post_path @posts
    else
      flash[:alert] = t ".error"
      render :edit
    end
  end

  def show
  end

  def destroy
    if @post.destroy
      flash[:notice] = t ".success"
      redirect_to posts_path
    else
      flash[:alert] = t ".error"
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :content
  end

  def load_post
    @post = Post.find_by id: params[:id]
    render file: "public/404.html" unless @post
  end
end
