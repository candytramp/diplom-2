class ResearchEffortsController < ApplicationController
  before_action :set_research_effort, only: [:show, :edit, :update, :destroy]

  # GET /research_efforts
  # GET /research_efforts.json
  def index
    @research_efforts = ResearchEffort.all
  end

  # GET /research_efforts/1
  # GET /research_efforts/1.json
  def show
  end

  # GET /research_efforts/new
  def new
    @research_effort = ResearchEffort.new
  end

  # GET /research_efforts/1/edit
  def edit
  end

  # POST /research_efforts
  # POST /research_efforts.json
  def create
    @research_effort = ResearchEffort.new(research_effort_params)

    respond_to do |format|
      if @research_effort.save
        format.html { redirect_to @research_effort, notice: 'Research effort was successfully created.' }
        format.json { render :show, status: :created, location: @research_effort }
      else
        format.html { render :new }
        format.json { render json: @research_effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /research_efforts/1
  # PATCH/PUT /research_efforts/1.json
  def update
    respond_to do |format|
      if @research_effort.update(research_effort_params)
        format.html { redirect_to @research_effort, notice: 'Research effort was successfully updated.' }
        format.json { render :show, status: :ok, location: @research_effort }
      else
        format.html { render :edit }
        format.json { render json: @research_effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /research_efforts/1
  # DELETE /research_efforts/1.json
  def destroy
    @research_effort.destroy
    respond_to do |format|
      format.html { redirect_to research_efforts_url, notice: 'Research effort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_effort
      @research_effort = ResearchEffort.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def research_effort_params
      params.require(:research_effort).permit(:name, :state_program_id, :start_date, :finish_date, :grnti_id, :field_id, :full_value, :year_value, :state_reg_number, :nir_number, :inventory_number, :nir_type_id, :source_id, :scientific_school_id, :is_nir, :creator_login, :creator_data)
    end
end
