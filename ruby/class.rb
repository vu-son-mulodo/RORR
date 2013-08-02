class Student
	def initialize(id = nil,name = nil,cl = nil)
		@id = id
		@name = name
		@cl = cl
	end

	def test
		showInformation
	end

	def showInformation
		unless @id.nil?
			puts "Student get id = #{@id}"
		end
		unless @name.nil?
			puts "Student get name = #{@name}"
		end
		unless @cl.nil?
			puts "Student get cl = #{@cl}"
		end
	end

	def changeName(name)
		if name.length > 0
			@name = name
		end
	end
end

class Students < Student
	$globalvalue = "This is global value" # It is global
	@@countStudent = 0
	@@Studentlist = Hash.new

	def initialize(id = nil,name = nil,cl = nil)
		super(id,name,cl)
		@@countStudent += 1
		@@Studentlist[:"#{id}"] = self
	end

	# Static function
    def self.getCount # or Student::getCount
		puts "There are #{@@countStudent} students"
	end

    def self.getStudent(id)
		return @@Studentlist[id]
	end

    def self.getStudentList
		return @@Studentlist
	end
end


puts $globalvalue
Students.new("001",:"Minh Phuc","3")
Students.new("002",:"Trong Hieu","4")
Students.new("003",:"Hami","5")

Students.getCount

student_1 = Students.getStudent(:"003")
student_1.test

student_1.changeName("Hung Anh")
student_1.test

student_2 = Students.getStudent(:"003")
student_2.test

StudentList = Students.getStudentList

puts "\n\n ~~~~~~~~List student :~~~~~~~~~~~ \n"
StudentList.each {|id,studentItem|
	studentItem.test
}

