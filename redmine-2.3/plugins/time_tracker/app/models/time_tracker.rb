class TimeTracker < ActiveRecord::Base
  unloadable

  belongs_to :time_tracker_category
  before_validation :require_before_save_timetracker

  validates_presence_of :from, :to
  validate :validate_exist_parent_id
  validate :validate_from_and_to


  def validate_exist_parent_id
    if (self.time_tracker_category_id == 0) || (TimeTrackerCategory.find_by_id(self.time_tracker_category_id).nil?)
      errors.add(l('field_time_tracker_category_id'), l('msg_is_not_exist'))
    end
    if !TimeTrackerCategory.find_by_id_and_parent_id(self.time_tracker_category_id,0).nil?
      errors.add(l('field_time_tracker_category_id'), l('msg_is_not_child'))
    end

  end

  def validate_from_and_to
    if self.cost_time <= 0
      errors.add(l('field_from'), l('msg_more_than_to'))
    end
    if self.from.nil? || self.to.nil?
      errors.add(l('field_from'), l('msg_not_format_time')) if self.from.nil?
      errors.add(l('field_from'), l('msg_not_format_time')) if self.to.nil?
    else
      if self.to.to_time.strftime("%Y-%m-%d") != self.from.to_time.strftime("%Y-%m-%d")
        errors.add(l('field_from'), l('msg_day_equal_to'))
      end
    end
  end

  def require_before_save_timetracker
    self.user_id = User.current.id
    self.cost_time = self.to.to_i - self.from.to_i
  end

  def self.get_data_of_user(user_id)
    TimeTracker.where("user_id = ?" , user_id).order("`from` DESC")
  end
end
