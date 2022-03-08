class User
  protected attr_reader :weight
  attr_reader :name
  @@count = 0
  def greet = "私は、#{@name}です。よろしくお願いします。"

  public
  def initialize(name:, age:, weight:)
    @name, @age, @weight = name, age, weight
    @@count += 1
  end

  def self.mob
    age, weight = rand(18..65), rand(40..80)
    self.new(name: "モブキャラ#{weight}", age: age , weight: weight)
  end

  def self.counter_0 = @@count
  private_class_method :counter_0

  class << self
    private
    def counter_1 = @@count
  end

  private
  def self.counter_2 = @@count

  def get_age = @age

  public
  def heavier_than?(other)
    other.weight < @weight
  end

  def inspect = @name
end
