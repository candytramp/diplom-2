class StateProgramsController < ApplicationController
  before_action :set_state_program, only: [:show, :edit, :update, :destroy]

  # GET /state_programs
  # GET /state_programs.json
  def index
    @state_programs = StateProgram.all
  end

  # GET /state_programs/1
  # GET /state_programs/1.json
  def show
  end

  # GET /state_programs/new
  def new
    @state_program = StateProgram.new
  end

  # GET /state_programs/1/edit
  def edit
  end

  # POST /state_programs
  # POST /state_programs.json
  def create
    @state_program = StateProgram.new(state_program_params)

    respond_to do |format|
      if @state_program.save
        format.html { redirect_to @state_program, notice: 'State program was successfully created.' }
        format.json { render :show, status: :created, location: @state_program }
      else
        format.html { render :new }
        format.json { render json: @state_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /state_programs/1
  # PATCH/PUT /state_programs/1.json
  def update
    respond_to do |format|
      if @state_program.update(state_program_params)
        format.html { redirect_to @state_program, notice: 'State program was successfully updated.' }
        format.json { render :show, status: :ok, location: @state_program }
      else
        format.html { render :edit }
        format.json { render json: @state_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /state_programs/1
  # DELETE /state_programs/1.json
  def destroy
    @state_program.destroy
    respond_to do |format|
      format.html { redirect_to state_programs_url, notice: 'State program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state_program
      @state_program = StateProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_program_params
      params.require(:state_program).permit(:name)
    end
end
