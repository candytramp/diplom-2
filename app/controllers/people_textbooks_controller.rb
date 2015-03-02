class PeopleTextbooksController < ApplicationController
  before_action :set_people_textbook, only: [:show, :edit, :update, :destroy]

  # GET /people_textbooks
  # GET /people_textbooks.json
  def index
    @people_textbooks = PeopleTextbook.all
  end

  # GET /people_textbooks/1
  # GET /people_textbooks/1.json
  def show
  end

  # GET /people_textbooks/new
  def new
    @people_textbook = PeopleTextbook.new
  end

  # GET /people_textbooks/1/edit
  def edit
  end

  # POST /people_textbooks
  # POST /people_textbooks.json
  def create
    @people_textbook = PeopleTextbook.new(people_textbook_params)

    respond_to do |format|
      if @people_textbook.save
        format.html { redirect_to @people_textbook, notice: 'People textbook was successfully created.' }
        format.json { render :show, status: :created, location: @people_textbook }
      else
        format.html { render :new }
        format.json { render json: @people_textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people_textbooks/1
  # PATCH/PUT /people_textbooks/1.json
  def update
    respond_to do |format|
      if @people_textbook.update(people_textbook_params)
        format.html { redirect_to @people_textbook, notice: 'People textbook was successfully updated.' }
        format.json { render :show, status: :ok, location: @people_textbook }
      else
        format.html { render :edit }
        format.json { render json: @people_textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people_textbooks/1
  # DELETE /people_textbooks/1.json
  def destroy
    @people_textbook.destroy
    respond_to do |format|
      format.html { redirect_to people_textbooks_url, notice: 'People textbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_people_textbook
      @people_textbook = PeopleTextbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def people_textbook_params
      params.require(:people_textbook).permit(:textbook_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details)
    end
end
