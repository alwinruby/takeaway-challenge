require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { 'Kebab £5.50' }

  it 'shows menu with availible dishes and their corresponding prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

end
