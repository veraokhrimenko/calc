require 'simplecov'
require 'rspec'
SimpleCov.start 
require './calc.rb'

	
describe Calculator do
	before (:all) do
		@calc = Calculator.new
	end
	describe '#initialize' do
		it "return arg array" do
			@calc.should be_an_instance_of Calculator
		end
	end
	describe '#get' do
		it 'get instances without args and check it' do
			@calc.get().should eql []
			@calc.clear
		end
		it 'get instances numeric args and return it in array' do
			@calc.get(1).should eql [1]
			@calc.clear
			@calc.get(1,3,4).should eql [1, 3, 4]
			@calc.clear
		end
		it 'get instances mixes args and return it in array without string' do
			@calc.get(1,"a",4).should eql [1, 4]
			@calc.clear
		end
		it 'get instances strings args and return empty array' do
			@calc.get('a','b','c').should eql []
			@calc.clear
		end
	end
	describe '#plus' do
		it "return arguments sum for one arguments" do
			@calc.get(1)
			@calc.plus.should eql 1
			@calc.clear
		end
		it 'return sum for numeric arguments' do
			@calc.get(1,3,4)
			@calc.plus.should eql 8
			@calc.clear
		end
		it 'return sum for mixed arguments' do
			@calc.get(1,'a',4)
			@calc.plus.should eql 5
			@calc.clear
		end
		it 'return sum for strings arguments' do
			@calc.get('a','b','c')
			@calc.plus.should eql 0
			@calc.clear
		end
	end
	describe '#minus' do
		it 'return 0 minus for one arguments' do 
			@calc.get(1)
			@calc.minus.should eql -1
			@calc.clear
		end
		it 'return 0 minus for numeric arguments' do
			@calc.get(1,3,4)
			@calc.minus.should eql -8
			@calc.clear
		end
		it 'return 0 minus for mixed arguments' do
			@calc.get(1,'a',4)
			@calc.minus.should eql -5
			@calc.clear
		end
		it 'return 0 minus for strings arguments' do
			@calc.get('a','b','c')
			@calc.minus.should eql 0
			@calc.clear
		end
	end	
	describe '#clear' do
		it 'clear array' do
			@calc.get(1)
			@calc.clear.should eql []
			@calc.get(1,3,4)
			@calc.clear.should eql []
			@calc.get('a','b','c')
			@calc.clear.should eql []
		end
	end
end