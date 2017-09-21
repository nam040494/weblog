class UsersController < ApplicationController
  before_action :load_user, only: :show

  def index
    @users = User.all
  end

  def show
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    render file: "public/404.html" unless @user
  end
end
