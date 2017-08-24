class FeesController < ApplicationController
  before_action :set_fee, only: [:show, :edit, :update, :destroy]

  # GET /fees
  # GET /fees.json
  def index
    @fees = Fee.all
  end

  # GET /fees/1
  # GET /fees/1.json
  def show
  end

  # GET /fees/new
  def new
    @fee = Fee.new_blank()
    @fee.begin_date = params[:begin_date] if params[:begin_date].present?
    @fee.end_date = params[:end_date] if params[:end_date].present?
    find_selected_incomes
  end

  # GET /fees/1/edit
  def edit
    @fee.begin_date = params[:begin_date] if params[:begin_date].present?
    @fee.end_date = params[:end_date] if params[:end_date].present?
    # find_selected_incomes
  end

  # POST /fees
  # POST /fees.json
  def create
    @fee = Fee.new(fee_params)
    respond_to do |format|
      if @fee.save
        format.html { redirect_to @fee, notice: t('Fee was successfully created.') }
        format.json { render :show, status: :created, location: @fee }
      else
        find_selected_incomes
        format.html { render :new }
        format.json { render json: @fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fees/1
  # PATCH/PUT /fees/1.json
  def update
    respond_to do |format|
      logger.info("================1")
      if @fee.update(fee_params)
        logger.info("================2")
        format.html { redirect_to @fee, notice: t('Fee was successfully updated.') }
        format.json { render :show, status: :ok, location: @fee }
      else
        find_selected_incomes
        format.html { render :edit }
        format.json { render json: @fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fees/1
  # DELETE /fees/1.json
  def destroy
    @fee.destroy
    respond_to do |format|
      format.html { redirect_to fees_url, notice: t('Fee was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee
      @fee = Fee.find(params[:id])
    end

    def find_selected_incomes
      @fee.incomes = (Income.where(bill_date: (@fee.begin_date..@fee.end_date), fee: nil)).or(Income.where(fee: @fee))
      # candidate_incomes = (Income.where(bill_date: (@fee.begin_date..@fee.end_date), fee: nil)).or(Income.where(fee: @fee))
      # db_incomes_id = @fee.incomes.map {|income| income.id}
      # @fee.incomes = Array.new
      # candidate_incomes.each do |income|
      #   if db_incomes_id.include?(income.id) 
      #     income.fee_extracted = true
      #     @fee.incomes << income
      #   else
      #     income.fee_extracted = 0
      #     @fee.incomes << income 
      #   end
      # end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_params
      params.require(:fee).permit(:begin_date, :end_date, :income_amount, :fee_amount, :part_amount1, :percent1, :part_amount2, :percent2,incomes_attributes: [:id, :fee_id, :fee_amount, :fee_extracted])
    end

    def updateIncomes
      # @fee.incomes.each do |income|
      #   if income.selected == 0
      #     income.fee = nil
      #     income.fee_amount = nil
      #   else 
      #     income.fee = @fee
      #   end
      # end
    end  
end
