class Product
  @name = 'Product'

  def self.name = @name

  def initialize(name)
    @name = name
  end

  def name = @name
end

class DVD < Product
  @name = 'DVD'
  def upcase_name = @name.upcase
end
