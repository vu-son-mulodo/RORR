require 'benchmark'
class TestSpeed

  def self.benchmark (list,title = "")
	puts title
	Benchmark.bm(25) do |x|
	  list.each {|e|
		x.report(":#{e}") { eval e }
	  }
	end

  end

end

#------------------------------Compare For and Times------------
#=begin
def timeSpeed (n,a)
  n.times do
	a += a
  end
end

def forSpeed (n,a)
  for num in 0...n do
	a += a
  end
end

TestSpeed.benchmark(["timeSpeed(1000,7)","forSpeed(1000,7)"])

#=end
#------------------------------Compare If and Unless------------
#=begin
def ifSpeed(n)
  test = 'abc'
  for num in 0...n do
	if test == nil
	  test = "abc"
	else
	  test = nil
	end
  end
end

def unlessSpeed(n)
  test = 'abc'
  for num in 0...n do
	unless test == nil
	  test = nil
	else
	  test = "abc"
	end
  end
end

TestSpeed.benchmark(["ifSpeed(1000)","unlessSpeed(1000)"])

#=end
#------------------------------Compare nil and == nil ------------
#=begin
def nilSpeed(n)
  test = 'abc'
  for num in 0...n do
	unless test.nil?
	  test = nil
	else
	  test = "abc"
	end
  end
end

def asnilSpeed(n)
  test = 'abc'
  for num in 0...n do
	unless test == nil
	  test = nil
	else
	  test = "abc"
	end
  end
end

def asasnilSpeed(n)
  test = 'abc'
  for num in 0...n do
	unless test === nil
	  test = nil
	else
	  test = "abc"
	end
  end
end

TestSpeed.benchmark(["nilSpeed(1000)","asnilSpeed(1000)","asasnilSpeed(1000)"])

#=end
#------------------------------Symbol and Character ------------

