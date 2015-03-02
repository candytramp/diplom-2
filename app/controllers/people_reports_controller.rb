class PeopleReportsController < ApplicationController
  before_action :set_people_report, only: [:show, :edit, :update, :destroy]

  # GET /people_reports
  # GET /people_reports.json
  def index
    @people_reports = PeopleReport.all
  end

  # GET /people_reports/1
  # GET /people_reports/1.json
  def show
  end

  # GET /people_reports/new
  def new
    @people_report = PeopleReport.new
  end

  # GET /people_reports/1/edit
  def edit
  end

  # POST /people_reports
  # POST /people_reports.json
  def create
    @people_report = PeopleReport.new(people_report_params)

    respond_to do |format|
      if @people_report.save
        format.html { redirect_to @people_report, notice: 'People report was successfully created.' }
        format.json { render :show, status: :created, location: @people_report }
      else
        format.html { render :new }
        format.json { render json: @people_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people_reports/1
  # PATCH/PUT /people_reports/1.json
  def update
    respond_to do |format|
      if @people_report.update(people_report_params)
        format.html { redirect_to @people_report, notice: 'People report was successfully updated.' }
        format.json { render :show, status: :ok, location: @people_report }
      else
        format.html { render :edit }
        format.json { render json: @people_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people_reports/1
  # DELETE /people_reports/1.json
  def destroy
    @people_report.destroy
    respond_to do |format|
      format.html { redirect_to people_reports_url, notice: 'People report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_people_report
      @people_report = PeopleReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def people_report_params
      params.require(:people_report).permit(:report_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details)
    end
end
