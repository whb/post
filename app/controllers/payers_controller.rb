class PayersController < ApplicationController
  before_action :set_payer, only: [:show, :edit, :update, :destroy]

  # GET /payers
  # GET /payers.json
  def index
    @payers = Payer.all
  end

  # GET /payers/1
  # GET /payers/1.json
  def show
  end

  # GET /payers/new
  def new
    @payer = Payer.new
  end

  # GET /payers/1/edit
  def edit
  end

  # POST /payers
  # POST /payers.json
  def create
    @payer = Payer.new(payer_params)

    respond_to do |format|
      if @payer.save
        format.html { redirect_to @payer, notice: t('Payer was successfully created.') }
        format.json { render :show, status: :created, location: @payer }
      else
        format.html { render :new }
        format.json { render json: @payer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payers/1
  # PATCH/PUT /payers/1.json
  def update
    respond_to do |format|
      if @payer.update(payer_params)
        format.html { redirect_to @payer, notice: t('Payer was successfully updated.') }
        format.json { render :show, status: :ok, location: @payer }
      else
        format.html { render :edit }
        format.json { render json: @payer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payers/1
  # DELETE /payers/1.json
  def destroy
    @payer.destroy
    respond_to do |format|
      format.html { redirect_to payers_url, notice: t('Payer was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payer
      @payer = Payer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payer_params
      params.require(:payer).permit(:code, :name, :brief_name, :status)
    end
end
