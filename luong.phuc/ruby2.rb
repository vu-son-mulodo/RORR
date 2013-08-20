class Test2
  attr_reader :a, :b, :num, :list

  def initialize(a, b)
	raise ArgumentError, ' a and b should be numberic and more than 2' unless (a.is_a? Numeric) && (b.is_a? Numeric)
	@a,@b = a,b
  end

  def required_num=(num)
	@num = num if (num.is_a? Numeric)
  end

  def run
	return nil if @num.nil?
	puts (@list = (@a..@b).select{|x| check_num(x) }).size
  end

  def check_num(x)
	temp = x.to_s.split(//)
	(sum(temp[0].to_i,temp[1].to_i) + sum(temp[2].to_i,temp[3].to_i)) == @num ? true : false
  end

  def sum(x,y)
	(x+y)%10
  end

end


a = Test2.new(1000,9999)
a.required_num=10
a.run
puts a.list.inspect
