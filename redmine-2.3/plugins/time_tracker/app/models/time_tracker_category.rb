class TimeTrackerCategory < ActiveRecord::Base
  unloadable

  include Redmine::SafeAttributes
  safe_attributes 'name','parent_id'

  validates_length_of :name, :maximum => 255
  validate :validate_exist_parent_id
  validate :validate_not_parent, on: :update

  before_validation :require_before_save_parent_id

  def validate_exist_parent_id
    if (self.parent_id != 0) && (TimeTrackerCategory.find_by_id(self.parent_id).nil?)
      errors.add(l('parent_id'), l('msg_is_not_exist'))
    end
  end

  def require_before_save_parent_id
    self.parent_id = '0' if self.parent_id.nil?
  end

  def validate_not_parent
    if !TimeTracker.find_by_time_tracker_category_id(self.id).nil? && self.parent_id == 0
      errors.add(l('field_time_tracker_category_id'), l('msg_is_not_empty'))
    end

  end

end
