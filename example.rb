# Array
# normal example
case [0, [1, 2, 3]]
when [0]
  :unreachable
when [0, [1]]
  :unreachable
when [0, [1, 2, 3]]
  p 'here'
end

# pattern matching example
case [0, [1, 2, 3]]
in [0, [1]]
  :unreachable
in [a, b]
  p a # => 0
  p b # => [1, 2, 3]
in [0, [1, 2, 3]]
  :unreachable
end

# ---

# splat operator
case [0, [1, 2, 3]]
in [a, [b, *c]]
  p a # => 0
  p b # => 1
  p c # => [2, 3]
end

# pattern matching cheks object structure.
case [0, [1, 2, 3]]
in [a]
  :unreachable
in a
  p a # => [0, [1, 2, 3]]
end