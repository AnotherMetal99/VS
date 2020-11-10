class LabReportsController < ApplicationController
  def index
    @lab_report = LabReport.all
  end

  def show
    @lab_report = LabReport.find(params[:id])
  end

  def new
    @lab_report = LabReport.new
  end

  def create
    @lab_report = LabReport.new(lab_report_params)

    if @lab_report.save
      redirect_to @lab_report, flash: { success: 'LabReport was added' }
    else
      render 'new', flash: { success: 'Some error occured' }
    end
  end

  def edit
    @lab_report = LabReport.find(params[:id])
  end

  def update
    @lab_report = LabReport.find(params[:id])
    @lab_report.update(lab_report_params)
    redirect_to @lab_report, flash: { success: 'LabReport was updated' }
  end

  def destroy
    @lab_report = LabReport.find(params[:id])
    @lab_report.destroy
    redirect_to action: :index
  end

  private

  def lab_report_params
    params.require(:lab_report).permit(:title, :description)
  end
end
