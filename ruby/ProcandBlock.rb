def space
  puts '------------------------------------------------------'
end

#------------------------------------------------------

useProc = Proc.new do |x|
  puts x
end

useProc.call 'Wellcome!'
useProc.call 'My name is Proc'

#------------------------------------------------------
space

def useYield num
  puts "Action yield :"
  yield num
end

useYield 10 do |num|
  for i in 0...num
	puts "Output number #{i}"
  end
  puts "End Yield"
end

#------------------------------------------------------
space

def lambdaFunction code
  puts "Run action lambda : "
  code.call "lambada"
end

lambdaFunction (lambda { |name|
  puts "I'm #{name}"
})

#------------------------------------------------------
space

def function
  puts "I'm function"
end

if defined? function
  eval "function"
else
  puts "Not function"
end