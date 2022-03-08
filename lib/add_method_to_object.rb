# public
# Objectクラスのインスタンス(main)のメソッドを定義
def what_method(method)
  methods = %i[public protected private singleton]
  methods.each do |m|
    return m if send("#{m}_methods").include?(method)
  end
  return
end
