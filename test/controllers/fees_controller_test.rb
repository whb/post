require 'test_helper'

class FeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fee = fees(:one)
  end

  test "should get index" do
    get fees_url
    assert_response :success
  end

  test "should get new" do
    get new_fee_url
    assert_response :success
  end

  test "should create fee" do
    assert_difference('Fee.count') do
      post fees_url, params: { fee: { begin_date: @fee.begin_date, end_date: @fee.end_date, fee_amount: @fee.fee_amount, income_amount: @fee.income_amount, part_amount1: @fee.part_amount1, part_amount2: @fee.part_amount2, percent1: @fee.percent1, percent2: @fee.percent2 } }
    end

    assert_redirected_to fee_url(Fee.last)
  end

  test "should show fee" do
    get fee_url(@fee)
    assert_response :success
  end

  test "should get edit" do
    get edit_fee_url(@fee)
    assert_response :success
  end

  test "should update fee" do
    patch fee_url(@fee), params: { fee: { begin_date: @fee.begin_date, end_date: @fee.end_date, fee_amount: @fee.fee_amount, income_amount: @fee.income_amount, part_amount1: @fee.part_amount1, part_amount2: @fee.part_amount2, percent1: @fee.percent1, percent2: @fee.percent2 } }
    assert_redirected_to fee_url(@fee)
  end

  test "should destroy fee" do
    assert_difference('Fee.count', -1) do
      delete fee_url(@fee)
    end

    assert_redirected_to fees_url
  end
end
