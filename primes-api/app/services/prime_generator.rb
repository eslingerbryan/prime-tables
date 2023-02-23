class PrimeGenerator
	def generate(n)
		return [2, 3, 5, 7, 11].take n if n <= 5

		estimate = n * Math.log(n) + n * Math.log(Math.log(n))
		return up_to(estimate).take(n)
	end

	def up_to(n)
		primes = (2..n).to_a
		
		primes.each do |i|
			next if i.nil?

			break if i * i > n
			(i * i).step(n, i) { |j| primes[j - 2] = nil }
		end

		primes.compact
	end
end
