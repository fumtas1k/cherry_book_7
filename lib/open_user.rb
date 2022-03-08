require_relative "user"

class OpenUser < User
  def get_age = "age: #{@age}"
  def greet = super + "#{@age}歳です!"
  # undef greet
  # remove_method :greet
end
