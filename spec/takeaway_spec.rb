require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }

  let(:menu) { double(:menu, print: printed_menu) }

  let(:order) { instance_double('Order', total: 21.50) }

  let(:sms) { instance_double('SMS', deliver: nil) }

  let(:printed_menu) { 'Kebab £5.50' }

  let(:dishes) { {shish: 2, donner: 3} }

  before do
    allow(order).to receive(:add)
  end

  it 'shows menu with availible dishes and their corresponding prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can place an order for available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'will know the order total' do
    # allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(21.50)
  end

  it 'sends an SMS when order is placed' do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end

end
