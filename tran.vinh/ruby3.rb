
class R1
  attr_accessor :required_num
 
  def initialize(m, n)
    @x = m.to_i
    @y = n.to_i
    @required_num = 10
  end
  
  def run
    if check_required_num?(@required_num)
      result_array = (@x..@y).select{|i| sum(i) == @required_num}
      result_array.each {|i| puts "#{i}=#{@required_num}"}
      puts "count: #{result_array.count}"
    end      
  end
  
  def check_required_num?(required_num)
     0 < required_num && required_num < 18 ? true :  (puts "required_num fail!!!")
  end  
  
  def sum (number)
   result = convert_array(int_split(number))
   result[0].to_i + result[1].to_i
  end
  
  def convert_array (array)
    length = array.length
    length%2 ==1 ? half=length/2+1 : half=length/2
    sub_array = sub_array(half,array)
    sub_array.length > 2 ? sum(sub_array) : sub_array
  end
  
  def sub_array(half,array)
    sub_array = []
    (0...half).each do |i|
      number  = array[i*2].to_i + array[(i*2)+1].to_i
      half < 2? sub_array.push(number) : sub_array.push(number%10)
    end 
    sub_array
  end  
  
  def int_split(number)
    number.to_s.split(//).map{|c| c.to_i}
  end
  
end  

   r1 = R1.new(1,9999)
   r1.required_num = 10
   r1.run

  