require './lib/account.rb'
class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    set_name(attrs[:name])
    @cash = 0
  end

  def set_name(obj)
      obj == nil ? missing_name : @name = obj
  end

  def missing_name
    raise 'A name is required'
  end

  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(amount)
    if @account == nil
      raise(RuntimeError, 'No account present')
    else
      @cash -= amount
      @account.balance += amount
    end
  end

  def withdraw(args = {})
    @account == nil ? missing_account : withdraw_funds(args)
  end

private

  def withdraw_funds(args)
    args[:atm] == nil ? missing_atm : atm = args[:atm]
    account = @account
    amount = args[:amount]
    pin = args[:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] == true ? increase_cash(response) : response
  end

  def increase_cash(response)
    if response[:amount] == nil
      raise 'Amount in ATM is nil'
    else
      @cash += response[:amount]
    end
  end

  def missing_atm
    raise RuntimeError, 'An ATM is required'
  end
end
