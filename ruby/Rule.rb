=begin
class A
  def read
    puts "Class A"
  end

  def no_op; end

end

class B < A; end
#like
C = Class.new(A)

#-----------------------------------------------------------------------

puts 'foo', 'bar'
#like
puts 'foo'
puts 'bar'

#1-----------------------------------------------------------------------
puts "Task 1"
result = (5>10) ? "More than" : "Less than"

if (5>10)
  (5>10) ? (puts "More than") : (puts "Less than")
else
  puts "Less than"
end

#-----------------------------------------------------------------------

x = !(5<10)

#2-----------------------------------------------------------------------
puts "Task 2"
if (5>10) && (10<5)
  puts "More than"
end

#document.saved? || document.save!

#3-----------------------------------------------------------------------
puts "Task 3"
puts "more than" if 10>5
#like
(10>5) && (puts "more than")

#4-----------------------------------------------------------------------
puts "Task 4"
puts "less than" unless 5>10
#like
(5>10) || (puts "less than")

#5-----------------------------------------------------------------------
puts "Task 5"
class Person
  attr_reader :name
  attr_accessor :age

def initialize(name,age)
  @name = name
  @age = age
end

end

temperance = Person.new('Temperance', 30)
temperance.age = 5
#temperance.name = "Phuc"
puts temperance.name , temperance.age

#6-----------------------------------------------------------------------
puts "Task 6"
arr = [1,2,3,4,5,6]
arr.map{ |number| number*2 }
arr.map!{ |number| number*2 }
puts arr

#7-----------------------------------------------------------------------
name = 'Phuc'
html = %(<tr><td class="name">#{name}</td>)
puts html
=end
a = [1]
puts (a.size.to_f/2)
puts (a.size.to_f/2).ceil




