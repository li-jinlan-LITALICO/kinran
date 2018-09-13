require 'test_helper'

class TagRelationshipTest < ActiveSupport::TestCase

  def setup
    @tag_relationship = TagRelationship.new(relative_item_id: items(:item_1).id,
                                     relative_tag_id: tags(:tag_1).id)
  end

  test "should be valid" do
    assert @tag_relationship.valid?
  end

  test "should require a relative_item_id" do
    @tag_relationship.relative_item_id = nil
    assert_not @tag_relationship.valid?
  end

  test "should require a relative_tag_id" do
    @tag_relationship.relative_tag_id = nil
    assert_not @tag_relationship.valid?
  end

  test "should relate a tag and a item" do
    item_2 = items(:item_2)
    tag_1  = tags(:tag_1)
    assert_not item_2.following?(tag_1)
    item_2.follow(tag_1)
    assert item_2.following?(tag_1)
    assert tag_1.relative_items.include?(item_2)
    item_2.unfollow(tag_1)
    assert_not item_2.following?(tag_1)
  end

end
