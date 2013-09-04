class TimeTrackersController < ApplicationController
  unloadable

  before_filter :require_login
  before_filter :find_time_tracker, :only => [:show, :edit, :update, :destroy]
  include TimeTrackersHelper

  def index
    @timetracker_pages, @timetrackers = paginate TimeTracker.get_data_of_user(params[:user_id]||=User.current.id), :per_page => 10
    @timetrackers = format_data(@timetrackers)
  end

  def chart_list
    @userlist = User.all
    @report_start_date = params[:report_start_date]
    @report_end_date = params[:report_end_date]
  end

  def chart
    @data_report = Report.get_report(params[:user_id],params[:report_start_date],params[:report_end_date])
    @sum = @data_report.sum{|report| report.time }
    @group_by_array = @data_report.group_by(&:parent_name).to_json
    render :layout => false
  end

  def new
    @timetracker = TimeTracker.new
    @form_timetracker = FormTimeTracker.new
  end

  def create
    @timetracker = TimeTracker.new(convert_param_to_model)
    @form_timetracker = FormTimeTracker.new(params[:form_timetracker])
    respond_to do |format|
      if @timetracker.save
        format.html { redirect_to time_trackers_path, notice: t('msg_tt_add_successful') }
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    return render_404 if @timetracker.nil?
  end

  def edit
    return render_404 if @timetracker.nil?
  end

  def update
    return render_404 if @timetracker.nil?
    respond_to do |format|
      if @timetracker.update_attributes(convert_param_to_model)
        format.html { redirect_to time_trackers_path, notice: t('msg_tt_update_successful') }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    return render_404 if @timetracker.nil?
    if @timetracker.destroy
      redirect_to time_trackers_path, notice: t('msg_tt_remove_successful')
    else
      flash.now[:error] = t('msg_ttc_can_not_remove')
    end
  end

  private

  def find_time_tracker
    @timetracker = TimeTracker.find_by_id_and_user_id(params[:id],User.current.id)
    @form_timetracker = FormTimeTracker.new(convert_model_to_param(@timetracker))
  end

  def convert_param_to_model
    return nil if params[:form_timetracker].nil?
    {
      :time_tracker_category_id => params[:form_timetracker][:field_time_tracker_category_id],
      :from => "#{params[:form_timetracker][:field_from]} #{params[:form_timetracker][:from_time]}",
      :to => "#{params[:form_timetracker][:field_to]} #{params[:form_timetracker][:to_time]}",
      :note => "#{params[:form_timetracker][:field_note]}"
    }
  end

  def convert_model_to_param(timetracker)
    return nil if timetracker.nil?
    {
      'field_time_tracker_category_id' => timetracker.time_tracker_category_id,
      'field_from' => timetracker.from.to_time.strftime("%Y-%m-%d"),
      'from_time' => timetracker.from.to_time.strftime("%H:%M"),
      'field_to' => timetracker.to.to_time.strftime("%Y-%m-%d"),
      'to_time' => timetracker.to.to_time.strftime("%H:%M"),
      'field_note' => timetracker.note
    }
  end

end
