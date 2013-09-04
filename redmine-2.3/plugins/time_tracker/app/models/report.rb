class Report < ActiveRecord::Base
  def self.columns() @columns ||= []; end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  column :id, :integer
  column :sub_id, :integer
  column :parent_id, :integer
  column :time, :integer
  column :sub_name, :string
  column :parent_name, :string


  def self.get_report(user_id, begin_date = Time.now.strftime("%Y-%m-%d"), end_date = Time.now.strftime("%Y-%m-%d"))
    sql="select tbl.*,mcat.name as parent_name from (select tker.id as id,sum(tker.cost_time) as time,tker.time_tracker_category_id as sub_id,cat.name as sub_name,cat.parent_id as parent_id from time_trackers as tker,time_tracker_categories as cat where user_id = ? and tker.from >= ? and tker.from <= ? and tker.time_tracker_category_id = cat.id group by sub_id) as tbl , time_tracker_categories as mcat where tbl.parent_id = mcat.id order by parent_name asc"
    format="%Y-%m-%d %H:%M:%S"
    begin_date = Date.today.at_beginning_of_month.strftime("%Y-%m-%d") if begin_date.nil?
    end_date = Date.today.at_end_of_month.strftime("%Y-%m-%d") if end_date.nil?
    begin
      begin_date = DateTime.strptime("#{begin_date} 00:00:00", format).to_time.to_s(:db)
      end_date = DateTime.strptime("#{end_date} 23:59:59", format).to_time.to_s(:db)
      Report.find_by_sql([sql,user_id,begin_date,end_date])
    rescue ArgumentError
      logger.fatal "Error>>>>>>>>>>>>>>> #{$!}"
      []
    end
  end
end
