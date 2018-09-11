require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  def setup
    @item = Item.new(name: 'goods_1', picture: 'picture_1.png', per_cost: 1000, description: '1歳児向けのお絵かき玩具です。' , stock_number: 100)
  end

  test "item name should be present" do
    @item.name = "   "
    assert_not @item.valid?
  end

  test "item name should be unique" do
    duplicate_item = @item.dup
    duplicate_item.name = @item.name.upcase
    @item.save
    assert_not duplicate_item.valid?
  end

  test "picture should be present" do
    @item.picture = "   "
    assert_not @item.valid?
  end

  test "per_cost should be present" do
    @item.per_cost = "   "
    assert_not @item.valid?
  end

  test "per_cost should be greater_than 99" do
    @item.per_cost = 99
    assert_not @item.valid?
  end

  test "description should be present" do
    @item.description = "   "
    assert_not @item.valid?
  end

  test "stock_number should be present" do
    @item.stock_number = "   "
    assert_not @item.valid?
  end

  test "stock_number should be greater_than 0" do
    @item.stock_number = 0
    assert_not @item.valid?
  end
end
