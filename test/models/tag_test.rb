require 'test_helper'

class TagTest < ActiveSupport::TestCase

  def setup
    @tag = Tag.new(name: 'aaa')
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
end
