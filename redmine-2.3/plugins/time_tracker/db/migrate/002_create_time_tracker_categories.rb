class CreateTimeTrackerCategories < ActiveRecord::Migration
  def change
    create_table :time_tracker_categories do |t|
      t.string  :name
      t.integer :parent_id, :null => true, :default => ''
    end
  end
end
