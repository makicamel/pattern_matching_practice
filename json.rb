require 'json'

person = '{
  "name": "Alice",
  "age": 30,
  "children": [
      {
          "name": "Bob",
          "age": 2
      }
  ]
}'

case JSON.parse(person, symbolize_names: true)
in {name: 'Alice', children: [{name: 'Bob', age: age}]}
  p age # => 2
end