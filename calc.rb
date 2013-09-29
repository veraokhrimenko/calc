class Calculator 
	attr_accessor :array
	def initialize
		@array = []		
	end
	def get(*args)
		args.each do |x| 
			@array << x if x.class == Fixnum
		end
		@array
	end
	def plus
		result =  @array.inject(0) {|result, element| result += element}		
	end
	def minus
		result = @array.inject(0) {|result, element| result -= element}
	end
	def clear
		@array.clear
	end
end

calc = Calculator.new





