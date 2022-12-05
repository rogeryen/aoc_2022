priority = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

sum = 0
File.foreach("./input.txt") do |line| 
    first_half = line[0..line.length/2-1]
    second_half = line[line.length/2..line.length]

    common = first_half.chars & second_half.chars
    sum += priority.index(common[0])
end

puts sum