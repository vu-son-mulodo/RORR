class Operator
  attr_accessor :x,:y

  def initialize(x,y)
	@x = x;
	@y = y;
  end

  def x=(x)
	@x += x
  end

  def y=(y)
	@y += y
  end

  def /(other)
	Operator.new(@x+other.x,@y+other.y)
  end

  def -@               # Define unary minus to negate width and height
    Operator.new(@x*@x, @y*5)
  end

end

item1 = Operator.new(5,7)
item1.x= 5

puts item1.x

item2 = Operator.new(10,15)

item3 = item1 / item2

puts "x = #{item3.x} ; y = #{item3.y}"

item4 = -item3
puts "x = #{item4.x} ; y = #{item4.y}"

