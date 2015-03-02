class ExhibitionPeopleController < ApplicationController
  before_action :set_exhibition_person, only: [:show, :edit, :update, :destroy]

  # GET /exhibition_people
  # GET /exhibition_people.json
  def index
    @exhibition_people = ExhibitionPerson.all
  end

  # GET /exhibition_people/1
  # GET /exhibition_people/1.json
  def show
  end

  # GET /exhibition_people/new
  def new
    @exhibition_person = ExhibitionPerson.new
  end

  # GET /exhibition_people/1/edit
  def edit
  end

  # POST /exhibition_people
  # POST /exhibition_people.json
  def create
    @exhibition_person = ExhibitionPerson.new(exhibition_person_params)

    respond_to do |format|
      if @exhibition_person.save
        format.html { redirect_to @exhibition_person, notice: 'Exhibition person was successfully created.' }
        format.json { render :show, status: :created, location: @exhibition_person }
      else
        format.html { render :new }
        format.json { render json: @exhibition_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exhibition_people/1
  # PATCH/PUT /exhibition_people/1.json
  def update
    respond_to do |format|
      if @exhibition_person.update(exhibition_person_params)
        format.html { redirect_to @exhibition_person, notice: 'Exhibition person was successfully updated.' }
        format.json { render :show, status: :ok, location: @exhibition_person }
      else
        format.html { render :edit }
        format.json { render json: @exhibition_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exhibition_people/1
  # DELETE /exhibition_people/1.json
  def destroy
    @exhibition_person.destroy
    respond_to do |format|
      format.html { redirect_to exhibition_people_url, notice: 'Exhibition person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhibition_person
      @exhibition_person = ExhibitionPerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exhibition_person_params
      params.require(:exhibition_person).permit(:exhibition_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details)
    end
end
