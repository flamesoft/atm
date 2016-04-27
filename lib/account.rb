class Account
  STANDARD_VALIDITY_YRS = 5
  attr_accessor :balance
  attr_reader :pin_code, :exp_date, :account_status, :owner

  def initialize(attrs = {})
    @pin_code = get_random_pin_code
    @exp_date = set_expire_date
    @balance = 0
    @account_status = :active
    set_owner(attrs[:owner])
  end

  def deactivate
    @account_status = :deactivated
  end

private

  def get_random_pin_code
    rand(1000..9999)
  end

  def set_expire_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime("%m/%y")
  end

 def set_owner(obj)
   obj == nil ? missing_owner : @owner = obj
 end

 def missing_owner
   raise "An Account owner is required"
 end

end
