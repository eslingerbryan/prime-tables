class PrimeGenerator
	def up_to(n)
		primes = (2..n).to_a
		factor = 2
		
		while factor ** 2  <= n do
			primes = primes.delete_if { |i| i > factor and i % factor == 0 }
			factor += 1
		end

		primes
	end
end
