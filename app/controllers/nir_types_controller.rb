class NirTypesController < ApplicationController
  before_action :set_nir_type, only: [:show, :edit, :update, :destroy]

  # GET /nir_types
  # GET /nir_types.json
  def index
    @nir_types = NirType.all
  end

  # GET /nir_types/1
  # GET /nir_types/1.json
  def show
  end

  # GET /nir_types/new
  def new
    @nir_type = NirType.new
  end

  # GET /nir_types/1/edit
  def edit
  end

  # POST /nir_types
  # POST /nir_types.json
  def create
    @nir_type = NirType.new(nir_type_params)

    respond_to do |format|
      if @nir_type.save
        format.html { redirect_to @nir_type, notice: 'Nir type was successfully created.' }
        format.json { render :show, status: :created, location: @nir_type }
      else
        format.html { render :new }
        format.json { render json: @nir_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nir_types/1
  # PATCH/PUT /nir_types/1.json
  def update
    respond_to do |format|
      if @nir_type.update(nir_type_params)
        format.html { redirect_to @nir_type, notice: 'Nir type was successfully updated.' }
        format.json { render :show, status: :ok, location: @nir_type }
      else
        format.html { render :edit }
        format.json { render json: @nir_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nir_types/1
  # DELETE /nir_types/1.json
  def destroy
    @nir_type.destroy
    respond_to do |format|
      format.html { redirect_to nir_types_url, notice: 'Nir type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nir_type
      @nir_type = NirType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nir_type_params
      params.require(:nir_type).permit(:name)
    end
end
