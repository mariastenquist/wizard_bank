require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/wizard"

class PersonTest < Minitest::Test 

	def test_that_class_exists
		person = Person.new("Minerva", 1000)
		assert_instance_of Person, person 
	end

	def test_that_it_has_a_name
		person = Person.new("Minerva", 1000)
		assert_equal "Minerva", person.name
	end

	def test_that_it_has_cash
		person = Person.new("Minerva", 1000)
		assert_equal 1000, person.cash
	end

	def test_that_another_person_instance_created
		person2 = Person.new("Luna", 500)
		assert_equal "Luna", person2.name
	end

	def test_another_person_can_have_cash
		person2 = Person.new("Luna", 500)
		assert_equal 500, person2.cash
	end

	def test_it_outputs_message
		person = Person.new("Minerva", 1000)
		expected = "Minerva has been created with 1000."
		assert_equal expected, person.message
	end
end