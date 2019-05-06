# ValuePattern ---
# all cases match.
case 0
in 0
in -1..1
in Integer
end

# VariablePattern ---
# `_` is used for like `*`.
case [0, 1]
in [_, _]
  :reachable
end

# Warning: Variable pattern always binds the variable.
# For using existing variable's value, use `^`.
a = 0
case 1
in a
  p a # => 1
end

# a = 0
# case 1
# in ^a
#   :unreachable
# end
# => NoMatchingPatternError

# AlternativePattern ---
case 0
in 0 | 1 | 2
  :reachable
end

# As Pattern ---
# Using `=>` and putting variable, variable is bound for value.
case 0
in Integer => a
  p a # => 0
end

case 0
in 0 | 1 | 2 => a
  p a # => 0
end

case [0, [1, 2]]
in [0, [1, _] => a]
  p a # => [1, 2]
end