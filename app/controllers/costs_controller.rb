class CostsController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_cost, only: [:show, :edit, :update, :destroy]
  before_filter :remember_last_collections_url

  def remember_last_collections_url
    last_collections_url = request.env['HTTP_REFERER'] || costs_url
    if [costs_url, query_costs_url].include? last_collections_url
      session[:last_cost_collection_url] = last_collections_url
    end
  end
  # GET /costs
  # GET /costs.json
  def index
    @costs = Cost.active
  end

  def query
    @costs = Cost.all
  end

  # GET /costs/1
  # GET /costs/1.json
  def show
  end

  # GET /costs/new
  def new
    @cost = Cost.new
  end

  # GET /costs/1/edit
  def edit
  end

  # POST /costs
  # POST /costs.json
  def create
    @cost = Cost.new(cost_params)

    respond_to do |format|
      if @cost.save
        @cost.income.save
        format.html { redirect_to @cost, notice: t('Cost was successfully created.') }
        format.json { render :show, status: :created, location: @cost }
      else
        format.html { render :new }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costs/1
  # PATCH/PUT /costs/1.json
  def update
    respond_to do |format|
      if @cost.update(cost_params)
        @cost.income.save
        format.html { redirect_to @cost, notice: t('Cost was successfully updated.') }
        format.json { render :show, status: :ok, location: @cost }
      else
        format.html { render :edit }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costs/1
  # DELETE /costs/1.json
  def destroy
    @cost.destroy
    respond_to do |format|
      format.html { redirect_to costs_url, notice: t('Cost was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost
      @cost = Cost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cost_params
      params.require(:cost).permit(:sn, :payee_id, :income_id, :abstract, :invoice_date, :tax_rate, :invoice_amount, :cost_date, :cost_amount, :explain,
        payments_attributes: [:id, :date, :amount, :_destroy])
    end
end
