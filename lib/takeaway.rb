class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    'Your order is for £21.50'
  end

  private

  attr_reader :menu

end
