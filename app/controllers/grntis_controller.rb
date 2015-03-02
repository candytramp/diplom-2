class GrntisController < ApplicationController
  before_action :set_grnti, only: [:show, :edit, :update, :destroy]

  # GET /grntis
  # GET /grntis.json
  def index
    @grntis = Grnti.all
  end

  # GET /grntis/1
  # GET /grntis/1.json
  def show
  end

  # GET /grntis/new
  def new
    @grnti = Grnti.new
  end

  # GET /grntis/1/edit
  def edit
  end

  # POST /grntis
  # POST /grntis.json
  def create
    @grnti = Grnti.new(grnti_params)

    respond_to do |format|
      if @grnti.save
        format.html { redirect_to @grnti, notice: 'Grnti was successfully created.' }
        format.json { render :show, status: :created, location: @grnti }
      else
        format.html { render :new }
        format.json { render json: @grnti.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grntis/1
  # PATCH/PUT /grntis/1.json
  def update
    respond_to do |format|
      if @grnti.update(grnti_params)
        format.html { redirect_to @grnti, notice: 'Grnti was successfully updated.' }
        format.json { render :show, status: :ok, location: @grnti }
      else
        format.html { render :edit }
        format.json { render json: @grnti.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grntis/1
  # DELETE /grntis/1.json
  def destroy
    @grnti.destroy
    respond_to do |format|
      format.html { redirect_to grntis_url, notice: 'Grnti was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grnti
      @grnti = Grnti.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grnti_params
      params.require(:grnti).permit(:name, :grnti)
    end
end
