
class ReportsController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!, :except => [:index, :search]

  def search
    @reports = Report.text_search(params[:query])
  end

  def show
    @report = Report.find(params[:id])
    render :action => :show
  end

  def edit
    @report = Report.find_by_id(params[:id])
    if @report.nil?
      redirect_to :action => :index
    end
    if @report.user_id != current_user.id
      redirect_to :action => :index
    end
  end

  def update
    @report = Report.find_by_id(params[:id])

    respond_to do |format|
      if @report.user_id == current_user.id && @report.update_attributes(params[:report])
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def index
    if user_signed_in?
      @reports = Report.paginate :page => params[:page], :per_page => 7, :conditions => ['user_id =?', current_user.id]
      if (@reports.count <= (7 * (params[:page].to_i - 1)))
        if (params[:page].to_i > 1)
          params[:page] = params[:page].to_i - 1
          @reports = Report.paginate :page => params[:page], :per_page => 7, :conditions => ['user_id =?', current_user.id]
        end
      end
      session[:page] = params[:page]
    else
      redirect_to new_user_registration_path
    end
  end

  def new
    @report = Report.new
  end

  def create
    @user = User.find_by_id(current_user.id)
    @report = @user.reports.build(params[:report])

    if @report.save
      flash[:notice] = "Report was successfully uploaded."
      redirect_to reports_path
    else
      flash[:error] = "Error."
      redirect_to new_report_path
    end
  end

  def destroy
    @report = Report.find_by_id(params[:id])

    if @report.user_id == current_user.id && @report.destroy
      flash[:notice] = "Report was successfully deleted."
    else
      flash[:error] = "Error."
    end
    
    redirect_to reports_path(@report, { :page => session[:page] })
  end
end
