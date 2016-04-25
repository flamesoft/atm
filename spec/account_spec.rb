require './lib/account.rb'
describe Account do
  #(pin_code,account_status,exp_date, balance, holder)
  let(:account) { instance_double('Account', pin_code: '1234',
    account_status: :active,  exp_date: '04/17', balance: 10000, holder: 'Calle') }

  before do
    allow(account).to receive(:balance)
    allow(account).to receive(:balance=)
  end

  it 'check if length of pin_code is 4' do
    number = account.pin_code.to_f
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
  end
end
