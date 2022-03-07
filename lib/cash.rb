class Cash
  MONEY = [JUYEN = 10, 50, 100, 500, 1000]
  @@var = 3
  def self.add_1
    @@var += 1
  end
end

MONEY = [10, 50, 100, 500, 1000]
MONEY_S = %w[10 50 100 500 1000].freeze
