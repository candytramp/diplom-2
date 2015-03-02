class ConferencePeopleController < ApplicationController
  before_action :set_conference_person, only: [:show, :edit, :update, :destroy]

  # GET /conference_people
  # GET /conference_people.json
  def index
    @conference_people = ConferencePerson.all
  end

  # GET /conference_people/1
  # GET /conference_people/1.json
  def show
  end

  # GET /conference_people/new
  def new
    @conference_person = ConferencePerson.new
  end

  # GET /conference_people/1/edit
  def edit
  end

  # POST /conference_people
  # POST /conference_people.json
  def create
    @conference_person = ConferencePerson.new(conference_person_params)

    respond_to do |format|
      if @conference_person.save
        format.html { redirect_to @conference_person, notice: 'Conference person was successfully created.' }
        format.json { render :show, status: :created, location: @conference_person }
      else
        format.html { render :new }
        format.json { render json: @conference_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conference_people/1
  # PATCH/PUT /conference_people/1.json
  def update
    respond_to do |format|
      if @conference_person.update(conference_person_params)
        format.html { redirect_to @conference_person, notice: 'Conference person was successfully updated.' }
        format.json { render :show, status: :ok, location: @conference_person }
      else
        format.html { render :edit }
        format.json { render json: @conference_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conference_people/1
  # DELETE /conference_people/1.json
  def destroy
    @conference_person.destroy
    respond_to do |format|
      format.html { redirect_to conference_people_url, notice: 'Conference person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conference_person
      @conference_person = ConferencePerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conference_person_params
      params.require(:conference_person).permit(:conference_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details)
    end
end
