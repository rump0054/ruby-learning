class Array
	def my_unique
		unique_els = []

		self.each do |el|
			unique_els << el unless unique_els.include?(el)
		end

		unique_els
	end

	def pair_sums_to_zero
		self.each do |num|	
			self.each do |num2|
				return true if num + num2 == 0
			end
		end
	end

	false
end

not_unique = [1, 2, 1, 3, 3]
pairs = [10, 76 -10, 0]
pairs2 = [1, 0, 5, 3, 9, 0]
pairs3 = [0, 1, 2, 3, 4, 5]

puts not_unique.my_unique == [1, 2, 3]
puts pairs.pair_sums_to_zero
puts pairs2.pair_sums_to_zero
puts pairs3.pair_sums_to_zero

=begin
def my_unique(array)
	unique_els = []

	array.each do |el|
		unique_els << el unless unique_els.include?(el)
	end

	unique_els
end

puts my_unique([1, 2, 1, 3, 3])
=end