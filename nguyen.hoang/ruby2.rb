class SatisfyNumber

  def initialize
  end

  def count_satisfy_number
    counts = 0
    (1000..9999).each {|i| puts "#{i}=10" if is_satify_number?(i)
						   counts += 1    if is_satify_number?(i) }
    puts "count : #{counts}"
  end

  def is_satify_number?(number)
    total = sum(number)
    return true if total == 10
    return false if total != 10
  end

  def get_thousand(number)
	return (number/1000)
  end

  def get_hundred(number)
	return (number % 1000)/100
  end

  def get_dozen(number)
	return (((number % 1000) % 100) / 10)
  end

  def get_ni(number)
	return (number % 10)
  end

  def sum(number)
	sum = ((get_thousand(number) + get_hundred(number)) % 10 ) + ((get_dozen(number) + get_ni(number)) % 10)
	return sum
  end
end

a = SatisfyNumber.new
a.count_satisfy_number
