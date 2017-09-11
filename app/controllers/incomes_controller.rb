class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy, :pay]
  before_filter :remember_last_collections_url

  def remember_last_collections_url
    last_collections_url = request.env['HTTP_REFERER'] || incomes_url
    if [incomes_url, all_incomes_url].include? last_collections_url
      session[:last_income_collection_url] = last_collections_url
    end
  end
  # GET /incomes
  # GET /incomes.json
  def index
    @incomes = Income.where(status: [:active, :revenued])
  end

  def all
    @incomes = Income.all
  end

  # GET /incomes/1
  # GET /incomes/1.json
  def show
  end

  # GET /incomes/new
  def new
    @income = Income.new_blank
  end

  # GET /incomes/1/edit
  def edit
  end

  # POST /incomes
  # POST /incomes.json
  def create
    @income = Income.new(income_params)

    respond_to do |format|
      if @income.save
        format.html { redirect_to @income, notice: t('Income was successfully created.') }
        format.json { render :show, status: :created, location: @income }
      else
        format.html { render :new }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incomes/1
  # PATCH/PUT /incomes/1.json
  def update
    respond_to do |format|
      if @income.update(income_params)
        format.html { redirect_to @income, notice: t('Income was successfully updated.') }
        format.json { render :show, status: :ok, location: @income }
      else
        format.html { render :edit }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income.destroy
    respond_to do |format|
      format.html { redirect_to incomes_url, notice: t('Income was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  # GET /incomes/1/pay
  def pay
    @cost = Cost.new_blank(@income)
    render "costs/new"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_params
      params.require(:income).permit(:fee_amount, :code, :payer_id, :abstract, :bill_date, :account_date, :income_amount, :settlement_amount, :invoice_date, :invoice_num, :tax_rate, :explain, :discount_rate, :available_amount, :actual_amount, :actual_date, 
          revenues_attributes: [:id, :date, :amount, :_destroy])
    end

    def peroid_params
      params.require(:peroid).permit(:begin, :end)
    end
end
