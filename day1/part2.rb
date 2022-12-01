
calories = []
current_calories = 0

File.foreach("input.txt") do |line| 
    unless line == "\n"
        current_calories += line.to_i
    else
        calories << current_calories
        current_calories = 0
    end
end

puts calories.sort.reverse.first(3).sum