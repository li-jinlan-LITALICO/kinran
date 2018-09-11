require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  def setup
    @user = users(:user_1)
    # このコードは慣習的に正しくない
    @order = Order.new(shipped_user_name: 'likinran', user_id: @user.id, shipped_postal_code: '332-0034',shipped_address: '東京都品川区3-3-1',shipped_phone_number: '03-3498-1283',
                       billing_amount: 100000, ordered_digest: "$2a$10$KPpxuDFqTun8PTSEgVCIWOAgCD1EOD3AsjtIeYKhl8WY1lh9TI8nq", ordered_at: '2018-09-11 17:30:27')
  end

  test "should be valid" do
    assert @order.valid?
  end

  test "user id should be present" do
    @order.user_id = nil
    assert_not @order.valid?
  end

  test "shipped_user_name should be present" do
    @order.shipped_user_name = "   "
    assert_not @order.valid?
  end

  test "shipped_postal_code should be present" do
    @order.shipped_postal_code = "   "
    assert_not @order.valid?
  end

  test "shipped_address should be present" do
    @order.shipped_address = "   "
    assert_not @order.valid?
  end

  test "shipped_phone_number should be present" do
    @order.shipped_address = "   "
    assert_not @order.valid?
  end

  test "billing_amount should be present" do
    @order.billing_amount = "   "
    assert_not @order.valid?
  end

  test "billing_amount should be integer" do
    @order.billing_amount = "あああ"
    assert_not @order.valid?
  end

  test "ordered_digest should be present" do
    @order.ordered_digest = "   "
    assert_not @order.valid?
  end

  test "ordered_digest should be unique" do
    duplicate_order = @order.dup
    duplicate_order.ordered_digest = @order.ordered_digest.upcase
    @order.save
    assert_not duplicate_order.valid?
  end

  test "ordered_at should be present" do
    @order.ordered_at = "   "
    assert_not @order.valid?
  end

end
