class AuthorMonographsController < ApplicationController
  before_action :set_author_monograph, only: [:show, :edit, :update, :destroy]

  # GET /author_monographs
  # GET /author_monographs.json
  def index
    @author_monographs = AuthorMonograph.all
  end

  # GET /author_monographs/1
  # GET /author_monographs/1.json
  def show
  end

  # GET /author_monographs/new
  def new
    @author_monograph = AuthorMonograph.new
  end

  # GET /author_monographs/1/edit
  def edit
  end

  # POST /author_monographs
  # POST /author_monographs.json
  def create
    @author_monograph = AuthorMonograph.new(author_monograph_params)

    respond_to do |format|
      if @author_monograph.save
        format.html { redirect_to @author_monograph, notice: 'Author monograph was successfully created.' }
        format.json { render :show, status: :created, location: @author_monograph }
      else
        format.html { render :new }
        format.json { render json: @author_monograph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /author_monographs/1
  # PATCH/PUT /author_monographs/1.json
  def update
    respond_to do |format|
      if @author_monograph.update(author_monograph_params)
        format.html { redirect_to @author_monograph, notice: 'Author monograph was successfully updated.' }
        format.json { render :show, status: :ok, location: @author_monograph }
      else
        format.html { render :edit }
        format.json { render json: @author_monograph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /author_monographs/1
  # DELETE /author_monographs/1.json
  def destroy
    @author_monograph.destroy
    respond_to do |format|
      format.html { redirect_to author_monographs_url, notice: 'Author monograph was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author_monograph
      @author_monograph = AuthorMonograph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_monograph_params
      params.require(:author_monograph).permit(:monograph_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details, :pages)
    end
end
