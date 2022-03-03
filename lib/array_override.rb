a = [1, 2, 3]
puts "start: #{a}"
puts "before_redefine: #{a.replace([4,5])}"


class Array
  def replace(original, replacement)
    map{|e| e == original ? replacement : e}
  end
end

a = [1, 2, 3]
puts "start: #{a}"
puts "after_redefine: #{a.replace(1, 4)}"
