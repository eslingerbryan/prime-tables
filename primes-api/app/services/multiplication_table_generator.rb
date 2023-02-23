class MultiplicationTableGenerator
	def for(numbers)
		header = [nil] + numbers
		res = [header]
		numbers.each do |i|
			row = [i]
			numbers.each { |j| row << i * j }
			res << row
		end
		res
	end
end
