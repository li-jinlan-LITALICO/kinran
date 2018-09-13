require 'test_helper'

class TagTest < ActiveSupport::TestCase

  def setup
    @tag = Tag.new(name: 'aaa')
    @item = Item.new(name: 'goods_1', picture: 'picture_1.png', per_cost: 1000, description: '1歳児向けのお絵かき玩具です。' , stock_number: 100)
  end

  test "tag name should be present" do
    @tag.name = "   "
    assert_not @tag.valid?
  end

  test "tag name should be unique" do
    duplicate_tag = @tag.dup
    duplicate_tag.name = @tag.name.upcase
    @tag.save
    assert_not duplicate_tag.valid?
  end

  test "tag name should have a minimum length" do
    @tag.name = ""
    assert_not @tag.valid?
  end

  test "associated tag_relationships should be destroyed" do
    @tag.save
    @item.save
    TagRelationship.create!(relative_item_id: @item.id, relative_tag_id: @tag.id)
    assert_difference 'TagRelationship.count', -1 do
      @tag.destroy
    end
  end
  
end
