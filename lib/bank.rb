require "pry"
require "./lib/wizard"

class Bank
	attr_reader :bank_name

	def initialize(bank_name)
		@bank_name = bank_name
		@remaining_funds = 0
	end

	def bank_message
		"#{@bank_name} has been created."
	end

	def create_account(person)	
		"An account has been opened for #{person.name} with #{bank_name}."
	end

	def deposit(person, amount)
		if amount < person.cash
		@remaining_funds += amount
		"#{amount} galleons has been deposited into #{person.name}'s #{bank_name} account. Balance: #{amount} Cash: #{person.cash - amount}"
		else
			"#{person.name} does not have enough cash to perform this deposit."
		end
	end

	def withdrawal(person, amount)
		if amount < @remaining_funds
			"#{person.name} has withdrawn #{amount} galleons. Balance: #{@remaining_funds - amount}"
		else
			"Insufficient funds"
		end
	end

	def transfer(person, bank, amount)
		"#{person.name} has transferred #{amount} galleons from #{bank_name} to #{bank.bank_name}."

	end
end