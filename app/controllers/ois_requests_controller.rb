class OisRequestsController < ApplicationController
  before_action :set_ois_request, only: [:show, :edit, :update, :destroy]

  # GET /ois_requests
  # GET /ois_requests.json
  def index
    @ois_requests = OisRequest.all
  end

  # GET /ois_requests/1
  # GET /ois_requests/1.json
  def show
  end

  # GET /ois_requests/new
  def new
    @ois_request = OisRequest.new
  end

  # GET /ois_requests/1/edit
  def edit
  end

  # POST /ois_requests
  # POST /ois_requests.json
  def create
    @ois_request = OisRequest.new(ois_request_params)

    respond_to do |format|
      if @ois_request.save
        format.html { redirect_to @ois_request, notice: 'Ois request was successfully created.' }
        format.json { render :show, status: :created, location: @ois_request }
      else
        format.html { render :new }
        format.json { render json: @ois_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ois_requests/1
  # PATCH/PUT /ois_requests/1.json
  def update
    respond_to do |format|
      if @ois_request.update(ois_request_params)
        format.html { redirect_to @ois_request, notice: 'Ois request was successfully updated.' }
        format.json { render :show, status: :ok, location: @ois_request }
      else
        format.html { render :edit }
        format.json { render json: @ois_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ois_requests/1
  # DELETE /ois_requests/1.json
  def destroy
    @ois_request.destroy
    respond_to do |format|
      format.html { redirect_to ois_requests_url, notice: 'Ois request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ois_request
      @ois_request = OisRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ois_request_params
      params.require(:ois_request).permit(:number, :priority, :author, :name, :object, :reg_agency, :research_effort_id, :status, :creator_login, :creator_data)
    end
end
