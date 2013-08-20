
class Common

  def self.get_number
    result_array = (1000..9999).select{|i| convert_number(i) == 10}
    result_array.each {|i| puts "#{i}=10"}
    puts "count: #{result_array.count}"   
  end
 
  def self.get_number2
    result_array = (1000..9999).select{|i| convert_number2(i) == 10}
    result_array.each {|i| puts "#{i}=10"}
    puts "count: #{result_array.count}"
  end
  
  def self.convert_number2(number)
    array = int_split2(number)
    one = array[0] + array[1]
    two = array[2] + array[3]
    one%10 + two%10
  end
  
  def self.int_split2(number)
    number.to_s.split(//).map{|c| c.to_i}
  end
  
  def self.convert_number(number)
    array = int_split(number)
    one = array[0] + array[1]
    two = array[2] + array[3]
    one%10 + two%10
  end
  
  def self.int_split(x)
    r = []
    y = x
    while y > 0
      y, b = y.divmod 10
      r.unshift b
    end
    r
  end
  
  
end  

 Common.get_number()
 #Common.get_number2()
  