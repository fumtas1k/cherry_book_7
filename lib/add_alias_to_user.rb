class User
  alias hello greet

  alias_method :original_name, :name
  def name = "Mr. #{original_name}"
end
