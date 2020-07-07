def infix_postfix(str)
  @precidence = {
    "*" => 2,
    "/" => 2,
    "+" => 1,
    "-" => 1,
  }
  output = []
  stack = []
  expression = str.split(" ")
expression.each do | char |
  if char = str
    output << char
  elsif stack.empty?
        stack << char
  elsif stack.last == char
        stack << char
  elsif @precidence[stack.last] < @precidence[char]
        stack << char
  elsif @precidence[stack.last] > @precidence[char]
        count = 0
      stack.each do | s |
        if @precidence[s] > @precidence[char]
          output << s
          count += 1
        end
      end
        stack.pop(count)
        stack << char
  end
end
    until stack.empty?
      output << stack.pop
    end
  return output.join
end
p infix_postfix("a + b")
