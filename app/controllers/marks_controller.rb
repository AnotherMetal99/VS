class MarksController < ApplicationController
  before_action :get_report

  def create
    get_report

    mark_letter = get_mark

    @mark = @lab_report.build_mark(points: mark_letter[:mark], letter: mark_letter[:letter])

    if @mark.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def index
    @mark = Mark.all
  end

  def show
    @mark = Mark.find(params[:id])
  end

  def new
    @mark = Mark.new
  end

  def destroy
    @lab_report = LabReport.find(params[:lab_report_id])

    @mark = @lab_report.mark.destroy

    @mark.destroy

    redirect_to '/'
  end

  private

  def convert_to_letter(mark)
    case mark
    when 90..100
      'A'
    when 80..89
      'B'
    when 65..79
      'C'
    when 55..64
      'D'
    when 50..54
      'E'
    when 1..49
      'F'
    else
      'Error: No Mark'
    end
  end

  def get_mark
    hash = params.require(:mark).permit(:points)

    if hash[:points] != ''
      mark_int = hash[:points].to_i

      mark_letter = convert_to_letter(mark_int)

      hash = { mark: mark_int, letter: mark_letter }
    else
      mark_int = nil

      mark_letter = nil
    end

    { mark: mark_int, letter: mark_letter }
  end

  def get_report
    @lab_report = LabReport.find(params[:lab_report_id])
  end
end
