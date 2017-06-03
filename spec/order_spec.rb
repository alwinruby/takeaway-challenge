require 'order'

describe Order do

  subject(:order) { described_class.new }

  let(:dishes) do
    {
      shish: 2,
      donner: 3
    }
  end

  it 'selects a number of dishes off the menu' do
    order.add(:shish, 2)
    order.add(:donner, 3)
    expect(order.dishes).to eq(dishes)
  end

end
