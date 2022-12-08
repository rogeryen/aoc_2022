text = File.read("./input.txt")
i = 0
j = 3

while j < text.length
  new_array = text[i..j].chars
  if new_array.uniq == new_array
    p j + 1
    return
  end
  i += 1
  j += 1
end
