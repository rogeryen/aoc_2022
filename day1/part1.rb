
max_calories = 0
current_calories = 0
File.foreach("input.txt") do |line| 
    unless line == "\n"
        current_calories += line.to_i
    else
        max_calories = current_calories if current_calories > max_calories
        current_calories = 0
    end
end

puts max_calories
