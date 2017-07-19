require 'test_helper'

class CostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cost = costs(:one)
  end

  test "should get index" do
    get costs_url
    assert_response :success
  end

  test "should get new" do
    get new_cost_url
    assert_response :success
  end

  test "should create cost" do
    assert_difference('Cost.count') do
      post costs_url, params: { cost: { abstract: @cost.abstract, cost_amount: @cost.cost_amount, cost_date: @cost.cost_date, explain: @cost.explain, income_id: @cost.income_id, invoice_amount: @cost.invoice_amount, invoice_date: @cost.invoice_date, no: @cost.no, payee_id: @cost.payee_id, tax_rate: @cost.tax_rate } }
    end

    assert_redirected_to cost_url(Cost.last)
  end

  test "should show cost" do
    get cost_url(@cost)
    assert_response :success
  end

  test "should get edit" do
    get edit_cost_url(@cost)
    assert_response :success
  end

  test "should update cost" do
    patch cost_url(@cost), params: { cost: { abstract: @cost.abstract, cost_amount: @cost.cost_amount, cost_date: @cost.cost_date, explain: @cost.explain, income_id: @cost.income_id, invoice_amount: @cost.invoice_amount, invoice_date: @cost.invoice_date, no: @cost.no, payee_id: @cost.payee_id, tax_rate: @cost.tax_rate } }
    assert_redirected_to cost_url(@cost)
  end

  test "should destroy cost" do
    assert_difference('Cost.count', -1) do
      delete cost_url(@cost)
    end

    assert_redirected_to costs_url
  end
end
