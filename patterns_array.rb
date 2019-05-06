# ArrayPattern ---
# Object class needs to implement deconstruct method which returns Array.
# At Ruby2.7.0-dev, Array has deconstruct methods.
# class Array
#   def deconstruct
#     self
#   end
# end

case [0, 1, 2]
in Array(0, a, 2)
in Object[0, a, 2]
in [0, a, 2]
in 0, a, 2 # `[]` can be omitted.
end
p a # => 1

# ArrayPattern can be used besides Array.
class Struct
  alias deconstruct to_a
end

Color = Struct.new(:r, :g, :b)
color = Color[0, 10, 20]
p color.deconstruct # => [0, 10, 20]
case color
in Color[0, 0, 0]
  p 'black'
in Color[255, 0, 0]
  p 'red'
in Color[r, g, b]
  p "#{r}, #{g}, #{b}"
end