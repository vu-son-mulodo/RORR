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

  def sum(number)
		array = convert_number_to_array(number)
    sum = ((array[0] + array[1]) % 10 ) + ((array[2] + array[3]) % 10)
    return sum
  end

  def convert_number_to_array(number)
    number.to_s.scan(/./).map {|e| e.to_i}
  end
end

a = SatisfyNumber.new
a.count_satisfy_number
