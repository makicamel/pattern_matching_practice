# HashPattern ---
# Object class needs to implement deconstruct_keys method which returns Hash.
# At Ruby2.7.0-dev, Hash has deconstruct_keys methods.
# class Hash
#   def deconstruct_keys(keys)
#     self
#   end
# end

case {a: 0, b: 1}
in Hash(a: a, b: 1)
  p a # => 0
in Object[a: a]
in {a: a}
in {a: a, **rest}
  p rest # => {b: 1}
end

# `{}` can be omitted.
# `a:` is syntax sugar for `a: a`.
case {a: 0, b: 1}
in a:, b:
  p a # => 0
  p b # => 1
end

class Time
  VALID_KEYS = %i(year month)

  def deconstruct_keys(keys)
    if keys
      (VALID_KEYS & keys).each_with_object({}) do |k, h|
        h[k] = send(k)
      end
    else
      {year: year, month: month}
    end
  end
end

now = Time.now # 2019-05-07 ...
case now
in year: # Calls now.deconstruct_keys([:year])
  p year # => {year: 2019}
in **rest # Calls now.deconstruct_keys(nil)
  p rest # => {year: 2019, month: 5}
end