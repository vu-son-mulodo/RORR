class SatisfyNumber
  attr_accessor :min, :max, :require_number

  def initialize(min, max)
    @min, @max = min, max
  end

  def required_num=(number)
    @require_number = number
  end

  def run
    array = (min..max).select {|i| value_array(convert_number_to_array(i)) == @require_number}
    array.each{|i| puts "#{i}= #{@require_number}"}
    puts "count : #{array.count}"
  end

  def convert_number_to_array(number)
    number.to_s.scan(/./).map {|e| e.to_i}
  end

  def value_array(array)
    return array[0] % 18 if array.size == 1
    return (array[0] + array[1]) % 18 if array.size == 2
    new_array = convert_to_new_array(array)
    value_array(new_array) if array.size > 2
  end

  def convert_to_new_array(array)
    (0...(array.size.to_f/2).ceil).map{|i| (array[i*2].to_i + array[(i*2)+1].to_i) % 10}
  end
end

a = SatisfyNumber.new(999,9999)
a.required_num = 10
a.run

a = SatisfyNumber.new(12345600, 12345678)
a.required_num = 6
a.run
