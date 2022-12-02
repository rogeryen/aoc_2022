POINTS = {
    A: 1,
    X: 1,
    B: 2,
    Y: 2,
    C: 3,
    Z: 3,
}

WIN = 6
DRAW = 3
LOSE = 0

def play_hand(first, second)
    diff = second - first

    if diff == 1 || diff == -2
        result = WIN
    elsif diff == -1 || diff == 2
        result = LOSE
    else
        result = DRAW
    end

    second + result
end

total_points = 0
File.foreach("input.txt") do |line| 
    first, second = line.split
    total_points += play_hand(POINTS[first.to_sym], POINTS[second.to_sym])
end

puts total_points