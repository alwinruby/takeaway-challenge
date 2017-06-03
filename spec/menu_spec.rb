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

  it 'prints a list foods and prices' do
    printed_menu = 'Shish £5.50, Chicken £4.50, Kofte £5.00, Donner £3.50'
    expect(menu.printed).to eq(printed_menu)
  end

end
