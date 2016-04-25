class Account
  attr_accessor :balance, :holder, :pin_code, :exp_date, :account_status
  def initialize(pin_code,account_status,exp_date, balance, holder)
    @pin_code = pin_code.to_f
    @exp_date = exp_date
    @account_status = account_status
    self.balance = balance
    self.holder = holder
  end
end
