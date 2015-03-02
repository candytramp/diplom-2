class ScientificSchoolsController < ApplicationController
  before_action :set_scientific_school, only: [:show, :edit, :update, :destroy]

  # GET /scientific_schools
  # GET /scientific_schools.json
  def index
    @scientific_schools = ScientificSchool.all
  end

  # GET /scientific_schools/1
  # GET /scientific_schools/1.json
  def show
  end

  # GET /scientific_schools/new
  def new
    @scientific_school = ScientificSchool.new
  end

  # GET /scientific_schools/1/edit
  def edit
  end

  # POST /scientific_schools
  # POST /scientific_schools.json
  def create
    @scientific_school = ScientificSchool.new(scientific_school_params)

    respond_to do |format|
      if @scientific_school.save
        format.html { redirect_to @scientific_school, notice: 'Scientific school was successfully created.' }
        format.json { render :show, status: :created, location: @scientific_school }
      else
        format.html { render :new }
        format.json { render json: @scientific_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scientific_schools/1
  # PATCH/PUT /scientific_schools/1.json
  def update
    respond_to do |format|
      if @scientific_school.update(scientific_school_params)
        format.html { redirect_to @scientific_school, notice: 'Scientific school was successfully updated.' }
        format.json { render :show, status: :ok, location: @scientific_school }
      else
        format.html { render :edit }
        format.json { render json: @scientific_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scientific_schools/1
  # DELETE /scientific_schools/1.json
  def destroy
    @scientific_school.destroy
    respond_to do |format|
      format.html { redirect_to scientific_schools_url, notice: 'Scientific school was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scientific_school
      @scientific_school = ScientificSchool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scientific_school_params
      params.require(:scientific_school).permit(:name)
    end
end
