require './lib/account.rb'
describe Account do

  it 'check if length of pin_code is 4' do
    number = subject.pin_code
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
  end
end
