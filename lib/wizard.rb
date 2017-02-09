# require "./bank"

class Person
	attr_reader :name, :cash

	def initialize(name, cash)
		@name = name
		@cash = cash
	end

	def message
		 "#{@name} has been created with #{@cash}."
	end
end
puts person = Person.new("Minerva", 1000).message
puts person2 = Person.new("Luna", 500).message