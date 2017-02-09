require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/bank"


class BankTest < Minitest::Test 

	def test_it_has_a_class
		bank = Bank.new("JPMorgan")
		assert_instance_of Bank, bank
	end

	def test_it_can_take_another_bank_name
		bank2 = Bank.new("Barclays")
		assert_equal "Barclays", bank2.bank_name
	end

	def test_output_bank_message
		bank = Bank.new("Barclays")
		expected = "Barclays has been created."
		assert_equal expected, bank.bank_message
	end

	def test_account_associated_with_person
		bank = Bank.new("JPMorgan")
		person = Person.new("Minerva", 1000)
		expected = "An account has been opened for Minerva with JPMorgan."
		assert_equal expected, bank.create_account(person)
	end

	def test_it_can_have_deposits
		person = Person.new("Minerva", 1000)
		bank = Bank.new("JPMorgan")
		expected = "750 galleons has been deposited into Minerva's JPMorgan account. Balance: 750 Cash: 250"
		assert_equal expected, bank.deposit(person, 750)
	end

	def test_deposits_dont_exceed_cash_level
		person = Person.new("Minerva", 1000)
		bank = Bank.new("JPMorgan")
		expected = "Minerva does not have enough cash to perform this deposit."
		assert_equal expected, bank.deposit(person, 5000)
	end

	def test_withdrawals_possible
		person = Person.new("Minerva", 1000)
		bank = Bank.new("JPMorgan")
		bank.deposit(person, 500)
		expected = "Minerva has withdrawn 250 galleons. Balance: 250"
		assert_equal expected, bank.withdrawal(person, 250)
	end

	def test_withdrawals_doesnt_exceed_balance
		person = Person.new("Minerva", 1000)
		bank = Bank.new("JPMorgan")
		bank.deposit(person, 100)
		expected = "Insufficient funds"
		assert_equal expected, bank.withdrawal(person, 20000)
	end

	def test_transfers_to_other_banks_possible
		person = Person.new("Minerva", 2000)
		bank = Bank.new("JPMorgan")
		bank2 = Bank.new("Barclays")
		bank.deposit(person, 1500)
		expected = "Minerva has transferred 250 galleons from JPMorgan to Barclays."
		assert_equal expected, bank.transfer(person, bank2, 250)

	end

end
