require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }

  let(:order) { double(:order, total: 21.50) }

  let(:printed_menu) { 'Kebab £5.50' }

  let(:dishes) { {shish: 2, donner: 3} }

  it 'shows menu with availible dishes and their corresponding prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can place an order for available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'will know the order total' do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(21.50)
  end

end
