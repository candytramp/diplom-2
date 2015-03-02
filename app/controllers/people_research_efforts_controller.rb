class PeopleResearchEffortsController < ApplicationController
  before_action :set_people_research_effort, only: [:show, :edit, :update, :destroy]

  # GET /people_research_efforts
  # GET /people_research_efforts.json
  def index
    @people_research_efforts = PeopleResearchEffort.all
  end

  # GET /people_research_efforts/1
  # GET /people_research_efforts/1.json
  def show
  end

  # GET /people_research_efforts/new
  def new
    @people_research_effort = PeopleResearchEffort.new
  end

  # GET /people_research_efforts/1/edit
  def edit
  end

  # POST /people_research_efforts
  # POST /people_research_efforts.json
  def create
    @people_research_effort = PeopleResearchEffort.new(people_research_effort_params)

    respond_to do |format|
      if @people_research_effort.save
        format.html { redirect_to @people_research_effort, notice: 'People research effort was successfully created.' }
        format.json { render :show, status: :created, location: @people_research_effort }
      else
        format.html { render :new }
        format.json { render json: @people_research_effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people_research_efforts/1
  # PATCH/PUT /people_research_efforts/1.json
  def update
    respond_to do |format|
      if @people_research_effort.update(people_research_effort_params)
        format.html { redirect_to @people_research_effort, notice: 'People research effort was successfully updated.' }
        format.json { render :show, status: :ok, location: @people_research_effort }
      else
        format.html { render :edit }
        format.json { render json: @people_research_effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people_research_efforts/1
  # DELETE /people_research_efforts/1.json
  def destroy
    @people_research_effort.destroy
    respond_to do |format|
      format.html { redirect_to people_research_efforts_url, notice: 'People research effort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_people_research_effort
      @people_research_effort = PeopleResearchEffort.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def people_research_effort_params
      params.require(:people_research_effort).permit(:research_effort_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details, :person_value, :role)
    end
end
