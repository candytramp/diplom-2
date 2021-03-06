class DiplomasController < ApplicationController
  before_action :set_diploma, only: [:show, :edit, :update, :destroy]

  # GET /diplomas
  # GET /diplomas.json
  def index
    @diplomas = Diploma.all
  end

  # GET /diplomas/1
  # GET /diplomas/1.json
  def show
  end

  # GET /diplomas/new
  def new
    @diploma = Diploma.new
    @diploma.documents.build
  end

  # GET /diplomas/1/edit
  def edit
  end

  # POST /diplomas
  # POST /diplomas.json
  def create
    @diploma = Diploma.new(diploma_params)
    respond_to do |format|
      if @diploma.save
        format.html { redirect_to @diploma, notice: 'Diploma was successfully created.' }
        format.json { render :show, status: :created, location: @diploma }
      else
        format.html { render :new }
        format.json { render json: @diploma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diplomas/1
  # PATCH/PUT /diplomas/1.json
  def update
    respond_to do |format|
      if @diploma.update(diploma_params)
        format.html { redirect_to @diploma, notice: 'Diploma was successfully updated.' }
        format.json { render :show, status: :ok, location: @diploma }
      else
        format.html { render :edit }
        format.json { render json: @diploma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diplomas/1
  # DELETE /diplomas/1.json
  def destroy
    @diploma.destroy
    respond_to do |format|
      format.html { redirect_to diplomas_url, notice: 'Diploma was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diploma
      @diploma = Diploma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diploma_params
      params.require(:diploma).permit(:name, :issue_date, :issue_organization, :year, :creator_login, :creator_data, :reward_id, :reward_type, :reward_typed_id, documents_attributes: [:description, :paper, :_destroy, :id])
    end
end
