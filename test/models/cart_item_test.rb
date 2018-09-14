require 'test_helper'

class CartItemTest < ActiveSupport::TestCase

  def setup
    @user = users(:user_1)
    @item = items(:item_1)
    @cart_item = @user.cart_items.build(cart_item_number: 1, user_id: @user.id, item_id: @item.id)
  end

  test "should be valid" do
    assert @cart_item.valid?
  end

  test "should require a user_id" do
    @cart_item.user_id = nil
    assert_not @cart_item.valid?
  end

  test "should require a item_id" do
    @cart_item.item_id = nil
    assert_not @cart_item.valid?
  end

  test "user id should be present" do
    @cart_item.user_id = nil
    assert_not @cart_item.valid?
  end

  test "item id should be present" do
    @cart_item.item_id = nil
    assert_not @cart_item.valid?
  end

  test "icart_item_number should be present" do
    @cart_item.cart_item_number = nil
    assert_not @cart_item.valid?
  end

  test "icart_item_number should be greater_than 0" do
    @cart_item.cart_item_number = 0
    assert_not @cart_item.valid?
  end

  test "order should be most recent first" do
    assert_equal cart_items(:most_recent), CartItem.first
  end

end
