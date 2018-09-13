class TagsController < ApplicationController
  def create
  end

  def relative_items
    @tag = Tag.find(params[:id])
    @relative_items = @tag.relative_items.paginate(page: params[:page])
    render 'show'
  end
end
