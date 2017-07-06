require 'test_helper'

class IncomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @income = incomes(:one)
  end

  test "should get index" do
    get incomes_url
    assert_response :success
  end

  test "should get new" do
    get new_income_url
    assert_response :success
  end

  test "should create income" do
    assert_difference('Income.count') do
      post incomes_url, params: { income: { abstract: @income.abstract, account_date: @income.account_date, available_amount: @income.available_amount, bill_date: @income.bill_date, code: @income.code, discount_rate: @income.discount_rate, explain: @income.explain, income_amount: @income.income_amount, invoice_date: @income.invoice_date, invoice_num: @income.invoice_num, payer_id: @income.payer_id, settlement_amount: @income.settlement_amount, tax_rate: @income.tax_rate } }
    end

    assert_redirected_to income_url(Income.last)
  end

  test "should show income" do
    get income_url(@income)
    assert_response :success
  end

  test "should get edit" do
    get edit_income_url(@income)
    assert_response :success
  end

  test "should update income" do
    patch income_url(@income), params: { income: { abstract: @income.abstract, account_date: @income.account_date, available_amount: @income.available_amount, bill_date: @income.bill_date, code: @income.code, discount_rate: @income.discount_rate, explain: @income.explain, income_amount: @income.income_amount, invoice_date: @income.invoice_date, invoice_num: @income.invoice_num, payer_id: @income.payer_id, settlement_amount: @income.settlement_amount, tax_rate: @income.tax_rate } }
    assert_redirected_to income_url(@income)
  end

  test "should destroy income" do
    assert_difference('Income.count', -1) do
      delete income_url(@income)
    end

    assert_redirected_to incomes_url
  end
end
