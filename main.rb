require_relative "lib/cherry_class.rb"
def judge_abailable(instance, method)
  judge = instance.respond_to?(method)
  puts "呼び出し可能？: #{judge.to_s}"
  puts instance.send(method) if judge
end

@user = User.new(name: "noro", age: 33, range:20..40, weight: 65)

# public method? respond_to?は呼び出し可能か確認するメソッド
method = :initialize

# public method
method = :greet

# private method
method = :age
