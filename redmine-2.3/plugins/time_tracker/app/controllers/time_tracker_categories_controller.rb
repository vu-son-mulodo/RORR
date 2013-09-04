class TimeTrackerCategoriesController < ApplicationController
  unloadable

  before_filter :require_admin
  before_filter :find_time_tracker_category, :only => [:show, :edit, :update, :destroy]
  include TimeTrackerCategoriesHelper

  def index
    @timetrackercategories = TimeTrackerCategory.all
    @html = Tree.new(@timetrackercategories).html
  end

  def new
    @timetrackercategory = TimeTrackerCategory.new
    @timetrackercategory.safe_attributes = params[:timetrackercategory]
    @timetrackercategory.parent_id = params[:id]
  end

  def create
    @timetrackercategory = TimeTrackerCategory.new
    @timetrackercategory.safe_attributes = params[:timetrackercategory]
    respond_to do |format|
      if @timetrackercategory.save
        format.html { redirect_to time_tracker_categories_path, notice: t('msg_ttc_add_successful') }
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    return render_404 if @timetrackercategory.nil?
  end

  def edit
    return render_404 if @timetrackercategory.nil?
  end

  def update
    return render_404 if @timetrackercategory.nil?
    @timetrackercategory.safe_attributes = params[:timetrackercategory]
    respond_to do |format|
      if @timetrackercategory.save
        format.html { redirect_to time_tracker_categories_path, notice: t('msg_ttc_update_successful') }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    return render_404 if @timetrackercategory.nil?
    unless is_parent?
      TimeTracker.delete_all("time_tracker_category_id = #{@timetrackercategory.id}") unless @timetrackercategory.nil?
      @timetrackercategory.destroy
      redirect_to time_tracker_categories_path, notice: t('msg_ttc_remove_successful')
    else
      flash.now[:error] = t('msg_ttc_can_not_remove')
    end
  end

  private

  def is_parent?
    TimeTrackerCategory.find_by_parent_id(params[:id]).nil? ? false : true
  end

  def find_time_tracker_category
    @timetrackercategory = TimeTrackerCategory.find_by_id(params[:id])
  end

end
