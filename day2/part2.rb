TO_WIN_AGAINST = {
    rock: :paper,
    paper: :scissors,
    scissors: :rock,
}

TO_LOSE_AGIANST = {
    rock: :scissors,
    paper: :rock,
    scissors: :paper,
}

HANDS = {
    A: :rock,
    B: :paper,
    C: :scissors,
}

WIN = 6
DRAW = 3
LOSE = 0

RESULTS = {
    X: LOSE,
    Y: DRAW,
    Z: WIN,
}

POINTS = {
    rock: 1,
    paper: 2,
    scissors: 3,
}

def play_hand(opponent, result)
    case result
    when WIN
        result + POINTS[TO_WIN_AGAINST[opponent]]
    when DRAW
        result + POINTS[opponent]
    when LOSE
        result + POINTS[TO_LOSE_AGIANST[opponent]]
    end
end

total_points = 0
File.foreach("input.txt") do |line| 
    first, second = line.split
    total_points += play_hand(HANDS[first.to_sym], RESULTS[second.to_sym])
end

puts total_points