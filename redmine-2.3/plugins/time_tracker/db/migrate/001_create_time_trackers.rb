class CreateTimeTrackers < ActiveRecord::Migration
  def change
    create_table :time_trackers do |t|
      t.integer  :user_id
      t.integer  :time_tracker_category_id
      t.datetime :from
      t.datetime :to
      t.text     :note
      t.integer  :cost_time
    end
  end
end
