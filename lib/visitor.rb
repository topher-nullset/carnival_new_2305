class Visitor
  attr_reader :name, :height, :spending_money

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = parse_spending_money(spending_money)
    @preferences = []
  end

  def preferences
    @preferences
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(height_minimum)
    height >= height_minimum
  end

  private

  def parse_spending_money(spending_money)
    spending_money.gsub('$','').to_i
  end
end