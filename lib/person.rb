require './lib/account.rb'
require './lib/errorHandler.rb'

class Person
  attr_accessor :cash
  attr_reader :name, :account

  def initialize(attrs = {})
    set_name(attrs[:name])
    @cash = 0
  end

  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(amount)
    @account == nil ? ErrorHandler.alert('No account present') : deposit_funds(amount)
  end

  def withdraw(args = {})
    @account == nil ? ErrorHandler.alert('No account present') : withdraw_funds(args)
  end

private

  def deposit_funds(amount)
    @cash -= amount
    @account.balance += amount
  end

  def set_name(obj)
      obj == nil ? ErrorHandler.alert('A name is required') : @name = obj
  end

  def withdraw_funds(args)
    args[:atm] == nil ? ErrorHandler.alert('An ATM is required') : atm = args[:atm]
    account = @account
    amount = args[:amount]
    pin = args[:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] == true ? increase_cash(response) : response
  end

  def increase_cash(response)
    @cash += response[:amount]
  end

end
