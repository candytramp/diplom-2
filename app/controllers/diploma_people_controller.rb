class DiplomaPeopleController < ApplicationController
  before_action :set_diploma_person, only: [:show, :edit, :update, :destroy]

  # GET /diploma_people
  # GET /diploma_people.json
  def index
    @diploma_people = DiplomaPerson.all
  end

  # GET /diploma_people/1
  # GET /diploma_people/1.json
  def show
  end

  # GET /diploma_people/new
  def new
    @diploma_person = DiplomaPerson.new
  end

  # GET /diploma_people/1/edit
  def edit
  end

  # POST /diploma_people
  # POST /diploma_people.json
  def create
    @diploma_person = DiplomaPerson.new(diploma_person_params)

    respond_to do |format|
      if @diploma_person.save
        format.html { redirect_to @diploma_person, notice: 'Diploma person was successfully created.' }
        format.json { render :show, status: :created, location: @diploma_person }
      else
        format.html { render :new }
        format.json { render json: @diploma_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diploma_people/1
  # PATCH/PUT /diploma_people/1.json
  def update
    respond_to do |format|
      if @diploma_person.update(diploma_person_params)
        format.html { redirect_to @diploma_person, notice: 'Diploma person was successfully updated.' }
        format.json { render :show, status: :ok, location: @diploma_person }
      else
        format.html { render :edit }
        format.json { render json: @diploma_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diploma_people/1
  # DELETE /diploma_people/1.json
  def destroy
    @diploma_person.destroy
    respond_to do |format|
      format.html { redirect_to diploma_people_url, notice: 'Diploma person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diploma_person
      @diploma_person = DiplomaPerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diploma_person_params
      params.require(:diploma_person).permit(:diploma_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details)
    end
end
