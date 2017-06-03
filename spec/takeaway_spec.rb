require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  
  it 'shows menu with availible dishes and their corresponding prices' do
    expect(takeaway.print_menu).to eq('Menu List')
  end

end
