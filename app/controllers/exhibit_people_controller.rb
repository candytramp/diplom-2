class ExhibitPeopleController < ApplicationController
  before_action :set_exhibit_person, only: [:show, :edit, :update, :destroy]

  # GET /exhibit_people
  # GET /exhibit_people.json
  def index
    @exhibit_people = ExhibitPerson.all
  end

  # GET /exhibit_people/1
  # GET /exhibit_people/1.json
  def show
  end

  # GET /exhibit_people/new
  def new
    @exhibit_person = ExhibitPerson.new
  end

  # GET /exhibit_people/1/edit
  def edit
  end

  # POST /exhibit_people
  # POST /exhibit_people.json
  def create
    @exhibit_person = ExhibitPerson.new(exhibit_person_params)

    respond_to do |format|
      if @exhibit_person.save
        format.html { redirect_to @exhibit_person, notice: 'Exhibit person was successfully created.' }
        format.json { render :show, status: :created, location: @exhibit_person }
      else
        format.html { render :new }
        format.json { render json: @exhibit_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exhibit_people/1
  # PATCH/PUT /exhibit_people/1.json
  def update
    respond_to do |format|
      if @exhibit_person.update(exhibit_person_params)
        format.html { redirect_to @exhibit_person, notice: 'Exhibit person was successfully updated.' }
        format.json { render :show, status: :ok, location: @exhibit_person }
      else
        format.html { render :edit }
        format.json { render json: @exhibit_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exhibit_people/1
  # DELETE /exhibit_people/1.json
  def destroy
    @exhibit_person.destroy
    respond_to do |format|
      format.html { redirect_to exhibit_people_url, notice: 'Exhibit person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhibit_person
      @exhibit_person = ExhibitPerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exhibit_person_params
      params.require(:exhibit_person).permit(:exhibit_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details)
    end
end
