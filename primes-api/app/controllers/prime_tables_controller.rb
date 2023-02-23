class PrimeTablesController < ApplicationController
	def show
		primes = PrimeGenerator.new.generate(params[:n].to_i)
		multiplcation_table = MultiplicationTableGenerator.new.for(primes)
		render json: { data: multiplcation_table }
	end
end
