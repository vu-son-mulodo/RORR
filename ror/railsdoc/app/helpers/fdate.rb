class Fdate
  @@format = '%d-%m-%Y'
  @@formatTime = '%d-%m-%Y %H:%M:%S'
  @@timezone = "Hanoi"

  def self.string2Datez(date)
	return date.in_time_zone(@@timezone).strftime(@@formatTime)
  end

  def self.today
	return Date.current.to_time.to_i
  end

  def self.string2Date(str) #format : dd-mm-yyyy
	date = Date.strptime(str, @@format)
	return date.to_time.to_i
  end

  def self.date2String(unix)

	if (unix.is_a? Integer) && (unix > 0)
	  return Time.at(unix).strftime(@@format)
	else
	  return "###"
	end

  end

  def self.add(unix,days)
	d = Date._strptime(date2String(unix),@@format)
	d = Date.new(d[:year],d[:mon],d[:mday]) + days
	return d.strftime(@@format)
  end

end