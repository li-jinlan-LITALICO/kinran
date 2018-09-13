require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  def setup
    @item = Item.new(name: 'goods_1', picture: 'picture_1.png', per_cost: 1000, description: '1歳児向けのお絵かき玩具です。' , stock_number: 100)
    @user = User.new(name: 'kinran', email: 'kinran@gmail.com', postal_code: '3320034', address: '埼玉県川口市並木3丁目', phone_number: '0478888888',
                    password: 'foobar', password_confirmation: 'foobar')
    @tag = Tag.new(name: 'aaa')
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

  test "associated cart_items should be destroyed" do
    @user.save
    @item.save
    @user.cart_items.create!(cart_item_number: 1, user_id: @user.id, item_id: @item.id)
    assert_difference 'CartItem.count', -1 do
      @item.destroy
    end
  end

  test "associated tag_relationships should be destroyed" do
    @item.save
    @tag.save
    TagRelationship.create!(relative_item_id: @item.id, relative_tag_id: @tag.id)
    assert_difference 'TagRelationship.count', -1 do
      @item.destroy
    end
  end

end
