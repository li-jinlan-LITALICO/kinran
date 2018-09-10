class UsersController < ApplicationController

  # 無くて良い機能
  def show
    @user = User.find(params[:id])
  end

  # 無くて良い機能
  def new
    @user = User.new
  end

  # 無くて良い機能
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "新規登録が完了しました！"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    # 無くて良い機能
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :postal_code, :address, :phone_number)
    end
end
