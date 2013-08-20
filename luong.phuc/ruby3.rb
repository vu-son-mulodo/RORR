module GlobalTest
  class << self
	attr_accessor :min, :max
  end
end

class Test3
  attr_reader :a, :b, :num, :list

  def initialize(a, b)
	raise ArgumentError, ' a and b should be numberic and more than 2' unless (a.is_a? Numeric) && (b.is_a? Numeric) && (a < b)
	@a,@b = a,b
  end

  def required_num=(num)
	@num = num if (num.is_a? Numeric) && (num > GlobalTest.min) && (num < GlobalTest.max)
  end

  #Check number prefer with require number
  def check_num(x)
	(sum(x.to_s.split(//).map {|e| e.to_i }) == @num) ? true : false
  end

  #Sum all number in array
  def sum(a)
	return ((temp = a[0] + a[1]) > @num) ? temp%@num : temp if a.size === 2
	return a[0] if a.size === 1
	sum_with_size_than_2(a)
  end

  def sum_with_size_than_2(a)
	sum((0...(a.size/2 + a.size%2)).map{|x| a[x*2+1].nil? ? a[x*2] : (a[x*2]+a[x*2+1])%10 })
  end

  def run
	return nil if @num.nil?
	puts (@list = (@a..@b).select{|x| check_num(x) }).size
  end

end

GlobalTest.min = 0
GlobalTest.max = 18
a = Test3.new(1000,9999)
a.required_num = 10
a.run
a.list.each {|num| puts "#{num}=#{a.num}"}
