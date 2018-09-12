class TagsController < ApplicationController
  def create
  end

  def show
    @tags = Tag.all
    @tag = Tag.new
    @items = Item.all
    @items = Item.order('updated_at DESC').paginate(page: params[:page], per_page: 12)
  end
end
