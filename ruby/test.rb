	def sum(a)
		num = 10
		return ((temp = a[0] + a[1]) > num) ? temp%num : temp if a.size === 2
		return a[0] if a.size === 1
		sum_with_size_than_2(a)
	end

	def sum_with_size_than_2(a)
		puts sum((0...(a.size/2 + a.size%2)).map{|x| a[x*2+1].nil? ? a[x*2] : (a[x*2]+a[x*2+1])%10 })
	end


a=[0,0,8]
b=[5,3,6,8]
c=[3,9,2,3,6,8]
sum(a) || sum(b) || sum(c)

class A
	def test
		puts "Test1"
	end
end