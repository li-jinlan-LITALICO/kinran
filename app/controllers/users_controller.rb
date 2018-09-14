class UsersController < ApplicationController

  def add_cart_items
    @user = User.find(params[:id])
    @item = Item.find(params[:id])
    @cart_items = @user.cart_items
  end

end
