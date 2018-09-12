class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
    @items = Item.order('updated_at DESC').paginate(page: params[:page], per_page: 12)
  end
end
