module TimeTrackersHelper
  def format_data(timetracker)
    temp = {}
    output = []
    timetracker.each {|e|
      from_key = e.from.strftime("%Y-%m-%d")
      if temp[from_key].nil?
        temp[from_key] = ListTimeTracker.new({'date_from' => from_key,'data' => [e]})
        output.push(from_key)
      else
        temp[from_key].data.push(e)
      end
    }
    return output.map{|x| temp[x] }
  end
end