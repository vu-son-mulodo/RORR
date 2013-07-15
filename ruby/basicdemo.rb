=begin
	Create introduce about function demo
=end
def function(fn)
	puts "~~~~~~~~~~~~~~~End function #{fn} :~~~~~~~~~~~ \n\n"
end

# ---------------------Use Array----------------------
=begin
array = ["Albert", "Brenda", "Charles",
    "Dave", "Engelbert"]
if array.respond_to?("each")
	i = 1
	# get value from array
	array.each do |val|
			puts " value #{i} : #{val}"
		i += 1
	end
end

function("show array")
=end
# ---------------------Use Hash-----------------------
=begin
#Way 1 :
hash = {
	"NAME" => "Minh Phuc",
	"AGE"  => 18,
	"SEX"  => "Male"
}
puts hash["NAME"]
puts hash["AGE"]
puts hash["SEX"]

#Way 2 :
hash = Hash.new
hash["Name"] = "Phuc Minh"
hash["Age"] = 81
hash["Sex"] = "Female"
puts hash["Name"]
puts hash["Age"]
puts hash["Sex"]

function("show Hash")
=end
# ---------------------Use GetValueFromHash-----------
=begin
family = {
  "Homer" => "dad",
  "Marge" => "mom",
  "Lisa" => "sister",
  "Maggie" => "sister",
  "Abe" => "grandpa",
  "Santa's Little Helper" => "dog"
}

family.each do |x, y|
	puts "#{x}: #{y}"
end

function("Get Value From Hash")
=end
# ---------------------Use SortArray-----------------
=begin
family = {
  "Homer" => "dad",
  "Marge" => "mom",
  "Lisa" => "sister",
  "Maggie" => "sister",
  "Abe" => "grandpa",
  "Santa's Little Helper" => "dog"
}

#Sort asc
family = family.sort_by { |key,val| val}

#Sort desc
family.reverse!

family.each do |x, y|
	puts "#{x}: #{y}"
end

function("Get Sort Array")
=end
# ---------------------Use Input----------------------
=begin
print "What's your first name? "
first_name = gets.chomp
first_name.capitalize!

print "What's your last name? "
last_name = gets.chomp
last_name.capitalize!

print "What city are you from? "
city = gets.chomp
city.capitalize!

print "What state or province are you from? "
state = gets.chomp
state.upcase!

puts " Your name is #{first_name} #{last_name} and you're from #{city}, #{state}!"

function("Input")
=end
# ---------------------Use Format text----------------------
=begin
nick = "minhphuc86"
nick.downcase!
puts nick
nick.upcase!
puts nick

function("Format text")
=end
# ---------------------Use If----------------------
=begin
print "Please input number x: "
x = Integer(gets.chomp)
print "Please input number y: "
y = Integer(gets.chomp)

if x == y
	puts " #{x} = #{y}"
elsif x <= y
	puts " #{x} <= #{y}"
elsif x >= y
	puts " #{x} >= #{y}"
else
	puts " #{x} != #{y}"
end

function("Use If")
=end
# ---------------------Use Replace----------------------
=begin
print "Please input string need replace (please exist 's'): "
user_input = gets.chomp
user_input.downcase!

if user_input.include? "s"
  user_input.gsub!(/s/, "th")
else
  puts "Nothing to do here!"
end

puts "Your string is: #{user_input}"

function("Use replace")
=end
# ---------------------Use Split----------------------
=begin
puts "please input text with space : "
input1 = gets.chomp
puts "Please input text what you want to find : "
input2 = gets.chomp
words = input1.split(" ")

words.each do |word|
    if word == input2
        print "Replace"
    else
        print " "
    end
end

function("Use Split")
=end
# ---------------------Use While and Until------------
=begin
i = 0
# With While : action if I <= 5
while i <= 5
	puts "while puts : #{i}"
	i += 1
end

# With Until : action until i < 0
until i < 0
	puts "until puts : #{i}"
	i -= 1
end

function("Use While and Until")
=end
# ---------------------Use For----------------------
=begin
for i in 1..10
	puts "for puts #{i} from 1 -> 10"
end

for i in 1...10
	puts "for puts #{i} from 1 -> (<10)"
end

function("Use For")
=end
# ---------------------Use Different between Symbols and String----------------------
=begin
print "String : "
print "abcd".object_id
print " != "
print "abcd".object_id
puts ""

print "Symbol : "
print :abcd.object_id
print " == "
print :abcd.object_id
print " == "
#convert String to symbols
print "abcd".to_sym.object_id
#string=symbols
string = :abcd
print " == "
print string.object_id
puts ""

#Symbols can't change
##puts "hello" << " world" ==> true
##puts :hello << :" world" ==> ERROR

function("Different between Symbols and String")
=end
# ---------------------Use Block on Ruby----------------------
=begin
class Array
	def aAction1!
		self.each_with_index do |n, i|
			self[i] = yield(n)
		end
	end

	#the other way
	def aAction2!(&code)
		self.each_with_index do |n, i|
			self[i] = code.call(n)
		end
	end
end

array = [1, 2, 3, 4]

array.aAction1! do |n|
	n * 2
end
puts array.inspect

array.aAction2! do |n|
	n / 2
end
puts array.inspect
=end
# ---------------------Use Proc on Ruby----------------------
=begin
class ClassNum
	attr_accessor :num
	def initialize(num = nil)
		@num = num
	end

	# Use Proc
	def changeNum1!(code)
		@num = code.call(@num)
	end

	# Use Block
	def changeNum2!(&code)
		@num = code.call(@num)
	end
end

square = Proc.new do |n|
  n ** 2
end

number = ClassNum.new(5)
puts number.num

# Use Proc
number.changeNum1!(square)
puts number.num

# Use Block
number.changeNum2! do |n|
  n / 2
end
puts number.num

=end
# ---------------------Use lambda instead Proc----------------------
#=begin
def args(code)
  one, two = 1, 2
  code.call(one, two)
end

#args(Proc.new{|a, b, c| puts "Give me a #{a} and a #{b} and a #{c.class}"})
args(lambda{|a, b| puts "Give me a #{a} and a #{b}"})
#=end
# ---------------------Create list action by Proc on Ruby----------------------
=begin
def callbacks(procs)
  procs[:starting].call

  puts "Still going"

  procs[:finishing].call("goodbye see you again")
end

callbacks(:starting => Proc.new { puts "Starting" },
          :finishing => Proc.new { |n| puts "#{n}" })
=end
