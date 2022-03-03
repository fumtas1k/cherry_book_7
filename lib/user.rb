class User
  protected attr_reader :weight
  @@count = 0
  def greet = "私は、#{@name}です。よろしくお願いします。"

  public
  def initialize(name:, age:, weight:)
    @name, @age, @weight = name, age, weight
    @@count += 1
  end

  def self.mob
    age = rand(18..65)
    self.new(name: "モブキャラ#{age}", age: age , weight: rand(40..80))
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
end

public
# Objectクラスのインスタンス(main)のメソッドを定義
def what_method(method)
  methods = %i[public protected private singleton]
  methods.each do |m|
    return m if send("#{m}_methods").include?(method)
  end
  return
end
