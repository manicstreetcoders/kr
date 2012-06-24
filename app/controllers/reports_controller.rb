
class ReportsController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!, :except => [:index]

  def index
    if user_signed_in?
      @user = current_user
      @reports = @user.reports.all
    else
      redirect_to new_user_registration_path
    end
  end

  def new
    @report = Report.new
  end

  def create
    @user = User.find(current_user.id)
    @report = @user.reports.build(params[:report])

    if @report.save
      redirect_to reports_index_path 
    else
      redirect_to new_reports_path
    end
  end
end
