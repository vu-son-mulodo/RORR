module Module1

  def Module1.sum(array = nil)

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

  def Module1.count(array = nil)
	if array.is_a? Array
	  return array.length
	end
  end


end
