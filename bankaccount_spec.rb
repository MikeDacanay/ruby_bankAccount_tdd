require_relative 'bankaccount'
RSpec.describe BankAccount do
	before(:each) do
		@bank1 = BankAccount.new()
	end

	# it 'Has a getter method for retrieving the checking account balance' do
	# 	expect(@bank1.account_number).to eq('0')
	# end ##this works

	it 'Has a getter method that retrieves the total account balance' do
		@bank1.deposit('checking',200)
		@bank1.deposit('checkingss',200)
		expect(@bank1.total).to eq('Checking Balance: 200 Saving Balance: 200 Total Balance: 400')
	end

	it 'Has a function that allows the user to withdraw cash' do
		@bank1.deposit('checking',200)
		@bank1.withdrawal('checking',67)
		expect(@bank1.checking).to eq(133)
	end

	context 'withdrawing money' do
		it 'raise error if account has less than drawing amount' do
			expect{@bank1.withdrawal('checking',10)}.to raise_error("Insufficient Funds, you have 0 in this account")
		end
	end

	it 'Raises an error when the user attempts to retrieve the total number of bank accounts' do
		expect{@bank1.number_of_accounts}.to raise_error(NoMethodError)
	end

	it 'Raises an error when the user attempts to set the interest rate' do
		expect{@bank1.interest_rate}.to raise_error(NoMethodError)
	end
end	