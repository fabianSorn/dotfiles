local array = { }

function array.range(x, y)
  local numbers = { }
  local counter = 0
  for number=x,y do
    numbers[counter]=number
    counter = counter + 1
  end
  return numbers
end

function array.join(list, separator)
  local result = ""
  for entry = 0, (#list - 2) do
    result = result .. list[entry]
    result = result .. separator
  end
  result = result .. list[#list]
  return result
end

return array
