class UsersController < ApplicationController
  # 不要では
  def show
    @user = User.find(params[:id])
  end

  # def new
  #   @user = User.new
  # end
end
