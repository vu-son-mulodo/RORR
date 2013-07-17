=begin
        create about function about ruby
=end

def function(fn)
    #code
    puts "~~~~~~~~~~~~~~~ End function #{fn} :~~~~~~~~~~~ \n\n"
end

#----------------------- use array ------------------------
=begin
    array = ["Hoang", "Minh", "Long", "Tam", "Phuc"]
    #if array.respond_to?("each")
        #i = 1
        #array.each do |val|
        #    puts "value #{i} : #{val}"
        #    i += 1
        #end
        i = 1
        for val in array
            puts "Value at #{i} is #{val}"
            i += 1
        end
    #end

    function("show array")
=end


#----------------------- use hash --------------------------
=begin
    hash = Hash.new
    hash["Name"] = "Nguyen Xuan Hoang"
    hash["Age"] = 19
    hash["Sex"] = "Nam"

    puts "My name is : "  + hash["Name"]
    puts "Age is : "  + hash["Age"].to_s()
    puts "Gender is : "  + hash["Sex"]

    function("use hash")
=end

#------------------use get value from hash ------------------
=begin
    hash = Hash.new
    hash["Name"] = "Nguyen Xuan Hoang"
    hash["Age"] = 19
    hash["Sex"] = "Nam"
    hash["Birthday"] = "13/07/88"
    hash["Add"] = "17/1P Nguyen Thi Tan"
    hash["Phone"] = 978256572

    hash.each { |key, value| print key + ' = ' + value.to_s() + "\n" }
    hash.delete("Phone")
    puts "After delete : "
    hash.each { |key, value| print key + ' = ' + value.to_s() + "\n" }

    function("use get value from hash")
=end


#-------------------- use sort array ------------------
=begin
    array = ["e", "c", "b", "d", "a"]
    p array.sort {|x,y| y <=> x }
    p array.sort {|x,y| x <=> y }
    # sort array
    sort_array = array.sort {|x,y| x <=> y }
    # reverse array
    reverst_array = sort_array.reverse
    # print arrays
    puts array
    puts sort_array
    puts reverst_array

    function("sort array")
=end


#----------------------  use input ----------------------
=begin
    print "What's your name ? "
    $stdout.flush
    my_name = gets.chomp
    my_name.capitalize!

    print "What's your country ? "
    $stdout.flush
    my_country = gets.chomp
    my_country.capitalize!

    puts "Hi, your name is #{my_name.upcase} and your country is #{my_country.upcase}"

    function("use input ruby")
=end

#----------------------  use if ----------------------

=begin
    print "Enter a number : "
    $stdout.flush
    #number = gets.chomp
    number = Integer(gets.chomp)


    if (number.to_i() > 10)
        puts "#{number} greater 10"
    else
        puts "#{number} is equal or smaller 10"
    end

    function("use if command !")
=end

#----------------------  use replace ----------------------
=begin
    #changing a section in string
    myString1 = "Welcome to Javascript"
    puts "String 1 is : #{myString1}"
    myString1["Javascript"] = "Ruby"
    puts "My new string is : #{myString1}"

    #or changing at a postion of string
    myString2 = "Welcome to PHP Essentials!"
    puts "String 2 is : #{myString2}"
    myString2[7] = "Ruby"
    puts myString2

    #use gsub
    myString3 = "Welcome to PHP Essentials!"
    puts "String 3 is: #{myString3}"
    myString3.gsub("PHP", "Ruby")
    puts myString3

    #repeating String
    puts myString3 * 3

    #insert text to string
    myString4 = "Paris in Spring"
    myString4.insert 8," the"
    puts myString4

    #reverse string
    puts myString4.reverse
=end

#-------------------- use split ------------------
=begin
    print "Enter a string contain space : "
    $stdout.flush
    input = gets.chomp
    input.capitalize!

    print "Enter string that you want to find :"
    $stdout.flush
    find = gets.chomp
    find.capitalize!

    word = input.split(" ")
    word.each {|word|
        if (word == find)
            puts "Replace"
        else
            puts " "
        end
    }
    function("use split")
=end
#-------------------- use while and util ------------------
=begin
    #while
    i = 0
    while i <= 5
        puts "Number is : #{i}"
        i += 1
    end

    #until
    i = 5
    until i<0
        puts "Number is : #{i}"
        i -= 1
    end
    function("use while and until!")
=end

#-------------------- use for ------------------
=begin
    my_array = [1,2,3,4,5,6,7,8,9]
    for i in 0..8
        if i%4==0
            puts "Value of i is : #{i}"
        end
    end

    function("use for command!")
=end

#-------------------- diff between symbols and string ------------------
=begin
    puts "hello world" #string
    puts :"hello world" #symbol
    bang = "!"
    puts "hello world #{bang}"
    puts :"hello world #{bang}"

    #convert between symbols and strings
    puts "hello work".intern
    puts :"hello work".to_s()

    #performance
    puts "hello world".object_id
    puts "hello world".object_id
    puts "hello world".object_id
    puts "hello world".object_id
    puts "hello world".object_id

    puts :"hello world".object_id
    puts :"hello world".object_id
    puts :"hello world".object_id
    puts :"hello world".object_id
    puts :"hello world".object_id
=end

#-------------------- use block  ------------------
=begin
    #The Two Different Block Notations
    [1,2,3,4,5].each {|i| print "#{i} "}

    [1,2,3,4,5].each do |i|
        print "#{i} "
    end

    class Array
        def iterate!
            self.each_with_index do |n, i|
               self[i] = yield(n)
            end
        end
    end

    array = [1, 2, 3, 4]

    array.iterate! do |n|
        n ** 2
    end

    puts array.inspect
    function("use block!")
=end

#-------------------- use Proc  ------------------
=begin
    class Array
        def iterate!(code)
            self.each_with_index do |n, i|
                self[i] = code.call(n)
            end
        end
    end

    array_1 = [1, 2, 3, 4]
    array_2 = [2, 3, 4, 5]

    square = Proc.new do |n|
      n ** 3
    end

    array_1.iterate!(square)
    array_2.iterate!(square)

    puts array_1.inspect
    puts array_2.inspect

    def callbacks(procs)
        procs[:starting].call

        puts "Still going"

        procs[:finishing].call
    end

    callbacks(:starting => Proc.new { puts "Starting" },
              :finishing => Proc.new { puts "Finishing" })
    function("use Proc!")
=end

#-------------------- use lambda  ------------------
#=begin
    def proc_return
        Proc.new { return "Proc.new"}.call
        return "proc_return method finished"
    end

    def lambda_return
        lambda { return "lambda" }.call
        return "lambda_return method finished"
    end

    puts proc_return
    puts lambda_return

    def generic_return(code)
        code.call
        return "generic_return method finished"
    end

    #puts generic_return(Proc.new { return "Proc.new" }) #unexpected return (LocalJumpError) because Proc is not method
    puts generic_return(lambda { return "lambda" })

    def generic_return1(code)
        one, two    = 1, 2
        three, four = code.call(one, two)
        return "Give me a #{three} and a #{four}"
    end

    puts generic_return1(lambda { |x, y| return x + 2, y + 2 })

    #puts generic_return1(Proc.new { |x, y| return x + 2, y + 2 })

    #puts generic_return1(Proc.new { |x, y| x + 2; y + 2 })

    puts generic_return1(Proc.new { |x, y| [x + 2, y + 2] })

#=end