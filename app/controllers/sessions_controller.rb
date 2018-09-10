class SessionsController < ApplicationController

  def new
  end

  def create
    #createアクションの中では、ユーザーの認証に必要なあらゆる情報をparamsハッシュから簡単に取り出せる
    user = User.find_by(email: params[:session][:email].downcase)
    # 入力されたメールアドレスを持つユーザーがデータベースに存在し、かつ入力されたパスワードがそのユーザーのパスワードである場合のみ、if文がtrueになる
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = '正しいメールもしくはパスワードではありません。'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
