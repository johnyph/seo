class ReportsController < ApplicationController
 
  def index
    @reports = Report.by_user(current_user).order("created_at DESC").paginate(:page => params[:page])
  end

  def show
    @report = Report.includes(:results => :keyword).includes(:results => :urls).where("reports.id = ?", params[:id]).first
  end


end
