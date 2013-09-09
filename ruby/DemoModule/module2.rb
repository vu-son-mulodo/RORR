module Module2

  def sum(array = nil)

	result = 0

	if array.is_a? Array

	  array.each do |x|
		if x.is_a? Numeric
		  result += x
		end

	  end

	end

	return result

  end

end
