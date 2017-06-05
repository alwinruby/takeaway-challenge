require 'order'
require 'menu'

describe Order do

  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double('Menu') }

  let(:dishes) do
    {
      shish: 2,
      donner: 3
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:shish).and_return(true)
    allow(menu).to receive(:has_dish?).with(:donner).and_return(true)
    allow(menu).to receive(:price).with(:shish).and_return(5.50)
    allow(menu).to receive(:price).with(:donner).and_return(3.50)

  end

  it 'selects a number of dishes off the menu' do
    order.add(:shish, 2)
    order.add(:donner, 3)
    expect(order.dishes).to eq(dishes)
  end

  it 'will not allow non-menu items to be added' do
    allow(menu).to receive(:has_dish?).with(:chips).and_return(false)
    expect { order.add(:chips, 2) }.to raise_error NoItemError, 'Chips are not on the menu'
  end

  it 'calculates the order total' do
    order.add(:shish, 2)
    order.add(:donner, 3)
    total = 21.50
    expect(order.total).to eq(total)
  end

end
