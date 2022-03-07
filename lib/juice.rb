class Juice
  attr_reader :name, :price
  def initialize(name:, price:)
    @name, @price = name, price
  end

  def self.coke
    Juice.new(name: :coke, price: 120)
  end
end
