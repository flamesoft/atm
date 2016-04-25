class Account
  STANDARD_VALIDITY_YRS = 5
  attr_accessor  :pin_code, :exp_date, :account_status, :balance, :holder
  def initialize
    @pin_code = get_random_pin_code
    @exp_date = set_expire_date
    @balance = 0
  end

  def get_random_pin_code
    rand(1000..9999)
  end

  def set_expire_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime("%m/%y")
  end
end
