class AuthorRequestsController < ApplicationController
  before_action :set_author_request, only: [:show, :edit, :update, :destroy]

  # GET /author_requests
  # GET /author_requests.json
  def index
    @author_requests = AuthorRequest.all
  end

  # GET /author_requests/1
  # GET /author_requests/1.json
  def show
  end

  # GET /author_requests/new
  def new
    @author_request = AuthorRequest.new
  end

  # GET /author_requests/1/edit
  def edit
  end

  # POST /author_requests
  # POST /author_requests.json
  def create
    @author_request = AuthorRequest.new(author_request_params)

    respond_to do |format|
      if @author_request.save
        format.html { redirect_to @author_request, notice: 'Author request was successfully created.' }
        format.json { render :show, status: :created, location: @author_request }
      else
        format.html { render :new }
        format.json { render json: @author_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /author_requests/1
  # PATCH/PUT /author_requests/1.json
  def update
    respond_to do |format|
      if @author_request.update(author_request_params)
        format.html { redirect_to @author_request, notice: 'Author request was successfully updated.' }
        format.json { render :show, status: :ok, location: @author_request }
      else
        format.html { render :edit }
        format.json { render json: @author_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /author_requests/1
  # DELETE /author_requests/1.json
  def destroy
    @author_request.destroy
    respond_to do |format|
      format.html { redirect_to author_requests_url, notice: 'Author request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author_request
      @author_request = AuthorRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_request_params
      params.require(:author_request).permit(:ois_request_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details)
    end
end
