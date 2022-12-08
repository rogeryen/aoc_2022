map = []
File.foreach("./input.txt") do |line|
  line.delete!("\n")
  map << line.chars.map(&:to_i)
end

row = 0
column = 0
max_row = map.length - 1
max_column = map[0].length - 1

scenic_scores = []
while row <= max_row
  column = 0
  while column <= max_column
    if row > 0 || column > 0 || row < map.length - 1 || column < map[row].length - 1
      height = map[row][column]

      scenic_top = 0
      (row-1).downto(0).to_a.each do |r|
        scenic_top += 1
        break if map[r][column] >= height
      end

      scenic_bot = 0
      (row+1..max_row).to_a.each do |r|
        scenic_bot += 1
        break if map[r][column] >= height
      end

      scenic_left = 0
      (column-1).downto(0).to_a.each do |c|
        scenic_left += 1
        break if map[row][c] >= height
      end

      scenic_right = 0
      (column+1..max_column).to_a.each do |c|
        scenic_right += 1
        break if map[row][c] >= height
      end
      scenic_score = scenic_left*scenic_right*scenic_top*scenic_bot
      scenic_scores << scenic_score
    end
    column += 1
  end
  row += 1
end
p scenic_scores.uniq.sort.last
