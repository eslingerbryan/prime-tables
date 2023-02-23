class PrimeGenerator
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
