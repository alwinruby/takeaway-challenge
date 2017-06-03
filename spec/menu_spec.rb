require 'menu'

describe Menu do

  let(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      shish: 5.50,
      chicken: 4.50,
      kofte: 5.00,
      donner: 3.50
    }
  end

  it 'has a list of foods and their prices' do
    expect(menu.dishes).to eq(dishes)
  end

end
