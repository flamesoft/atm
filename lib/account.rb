class Account
  attr_accessor  :pin_code, :exp_date, :account_status, :balance, :holder
  def initialize
    @pin_code = get_random_pin_code
    @exp_date = '04/17'

  end

  def get_random_pin_code
    rand(1000..9999)
  end
end
