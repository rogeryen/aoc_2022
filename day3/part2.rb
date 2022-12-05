priority = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

sacks = []
sum = 0
File.foreach("./input.txt") do |line| 
    sacks << line.chars
    next unless sacks.length == 3

    common = sacks[0] & sacks[1] & sacks[2]
    sum += priority.index(common[0])
    sacks = []
end

puts sum