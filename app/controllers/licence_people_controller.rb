class LicencePeopleController < ApplicationController
  before_action :set_licence_person, only: [:show, :edit, :update, :destroy]

  # GET /licence_people
  # GET /licence_people.json
  def index
    @licence_people = LicencePerson.all
  end

  # GET /licence_people/1
  # GET /licence_people/1.json
  def show
  end

  # GET /licence_people/new
  def new
    @licence_person = LicencePerson.new
  end

  # GET /licence_people/1/edit
  def edit
  end

  # POST /licence_people
  # POST /licence_people.json
  def create
    @licence_person = LicencePerson.new(licence_person_params)

    respond_to do |format|
      if @licence_person.save
        format.html { redirect_to @licence_person, notice: 'Licence person was successfully created.' }
        format.json { render :show, status: :created, location: @licence_person }
      else
        format.html { render :new }
        format.json { render json: @licence_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /licence_people/1
  # PATCH/PUT /licence_people/1.json
  def update
    respond_to do |format|
      if @licence_person.update(licence_person_params)
        format.html { redirect_to @licence_person, notice: 'Licence person was successfully updated.' }
        format.json { render :show, status: :ok, location: @licence_person }
      else
        format.html { render :edit }
        format.json { render json: @licence_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licence_people/1
  # DELETE /licence_people/1.json
  def destroy
    @licence_person.destroy
    respond_to do |format|
      format.html { redirect_to licence_people_url, notice: 'Licence person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_licence_person
      @licence_person = LicencePerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def licence_person_params
      params.require(:licence_person).permit(:licence_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details)
    end
end
