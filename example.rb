# Array
case [0, [1, 2, 3]]
when [0]
  :unreachable
when [0, [1]]
  :unreachable
when [0, [1, 2, 3]]
  p 'here'
end

case [0, [1, 2, 3]]
in [0]
  :unreachable
in [0, [1]]
  :unreachable
in [0, [a, b, c]]
  p a
  p b
  p c
in [0, [1, 2, 3]]
  :unreachable
end