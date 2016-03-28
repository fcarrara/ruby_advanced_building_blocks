def bubble_sort(arr)
	i = 0
	while i < arr.size - 1
		if (arr[i] > arr[i + 1])
			arr[i], arr[i + 1] = arr[i + 1], arr[i]
			i = 0
		end
		i += 1
	end
	arr
end

def bubble_sort_by(arr, &check_length)
	i = 0
	while i < arr.size - 1
		if check_length.call(arr[i], arr[i+1]) == 1
			arr[i], arr[i + 1] = arr[i + 1], arr[i]
			i = 0
		end
		i += 1
	end
	arr
end

check_length = Proc.new { |left, right| left.length <=> right.length }

puts bubble_sort([1,6,8,2,5,4,6])
puts bubble_sort_by(["hi", "hey", "hello"],&check_length)