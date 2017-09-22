class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i(index show)
  before_action :load_user, only: %i(show followers following)

  def index
    @users = User.order(:name)
      .page(params[:page]).per Settings.users.size
  end

  def show
    @post = @user.posts.build
  end

  def following
    @title = t ".following"
    @users = @user.following.page params[:page]
    render "show_follow"
  end

  def followers
    @title = t ".followers"
    @users = @user.followers.page params[:page]
    render "show_follow"
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    render file: "public/404.html" unless @user
  end
end
