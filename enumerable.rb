module Enumerable
	
	def my_each
		if block_given?
			0.upto(self.size - 1) do |i|
				yield(self[i])
			end
		end
		self
	end

	def my_each_with_index
		if block_given?
			0.upto(self.size - 1) do |i|
				yield(self[i], i)
			end
		end
		self
	end

	def my_select
		return self unless block_given?
		result = []
		my_each { |i| result << i if yield(i) }
		result
	end

	def my_all?
		if block_given?
			my_each { |i| return false unless yield(i) }
		else
			my_each { |i| return false if i.nil? || i == false}
		end
		true
	end

	def my_any?
		if block_given?
			my_each { |i| return true if yield(i) }
		  false
		else
			my_each { |i| return false if i.nil? || i == false }
			true
		end
	end

	def my_none?
		if block_given?
			my_each { |i| return false if yield(i) }
		else
			my_each { |i| return false if i == true }
		end
		true
	end

	def my_count(arg=nil)
		count = 0
		if arg.nil?
			my_each { count += 1 }
		elsif block_given?
			my_each { |i| count += 1 if yield(i) }
		else
			my_each { |i| count += 1 if i == arg }
		end
		count
	end

	def my_map
		return self unless block_given?
		result = []
		my_each { |i| result << yield(i) }
		result
	end

	def my_inject(arg=nil)
		memo = memo || shift
		if !arg.nil? 
			if !arg.is_a? Symbol
				return "#{arg} is not a symbol"
			else
				my_each { |i| memo = memo.send(arg, i) }
			end
		else
			if block_given?
				my_each { |i| memo = yield(memo,i) }
			else
				return "no block given"
			end
		end
		memo
	end

	# Map that accepts a block AND a proc
	def my_map(proc=nil)
		if !block_given?
			if proc
				result = []
				my_each { |i| result << proc.call(i) }
				result
			else
				return self
			end
		else
			result = []
			if proc
				my_each { |i| result << proc.call(i) }
				result
			end
			temp = []
			result.my_each { |i| temp << yield(i) }
			temp
		end
	end

end

def multiply_els(arr)
	arr.my_inject { |sum,n| sum * n }
end
