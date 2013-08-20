class SatisfyNumber
  attr_accessor :min, :max, :require_number

  def initialize(min, max)
    @min, @max = min, max
  end

  def required_num=(number)
	@require_number = number
  end

  def run
    counts = 0
    (min..max).each {|i| counts += count_satisfy_number(i) }
    puts "count : #{counts}"
  end

  def count_satisfy_number(i)
    counts = 0
    array = convert_number_to_array(i)
    value = value_array(array)
    counts += 1 if is_satisfy_number?(i,value)
    return counts
  end

  def is_satisfy_number?(i,value)
    if value == @require_number
      puts "#{i}=#{@require_number}"
      return true
    end
    return false
  end

  def convert_number_to_array(number)
    array = Array.new
    array.push(number) if number < 10
    process_convert_number_to_array(number, array) if number >= 10
    return array
  end

  def process_convert_number_to_array(number, array)
    while number >= 10
      a = number % 10
      number = number / 10
      array.push(a)
    end
    array.push(number)
    array = array.reverse
  end

  def value_array(array)
    return array[0] % 18 if array.size == 1
    return (array[0] + array[1]) % 18 if array.size == 2
    new_array = convert_to_new_array(array)
    value_array(new_array) if array.size > 2
  end

  def convert_to_new_array(array)
    i, arr = 0, []
    array = change_some_value_in_array(array, i)
    array.each_with_index {|el,index| arr << el if index % 2 == 0}
    return arr
  end

  def change_some_value_in_array(array, i)
    while i < array.size
						array[i] = array[i] if i == array.size - 1
      array[i] = (array[i] + array[i+1]) % 10 if i < array.size - 1
      i += 2
    end
    return array
  end

end

a = SatisfyNumber.new(999,9999)
a.required_num = 10
a.run

a = SatisfyNumber.new(12345600, 12345678)
a.required_num = 6
a.run
