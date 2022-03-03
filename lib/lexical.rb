class C
  CONST = "C::CONST"
end

CONST = "Object::CONST"

class C1 < C
  CONST2 = "C1::CONST2"

  class C2
    CONST2 = "C2::CONST2"
    puts CONST
    puts CONST2
  end

  puts CONST
  puts CONST2
end

class C
  puts CONST
end
