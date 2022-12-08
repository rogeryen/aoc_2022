map = []
File.foreach("./input.txt") do |line|
  line.delete!("\n")
  map << line.chars.map(&:to_i)
end

row = 0
column = 0
max_row = map.length - 1
max_column = map[0].length - 1

visible_trees = 0
while row <= max_row
  column = 0
  while column <= max_column
    if row == 0 || column == 0 || row == map.length - 1 || column == map[row].length - 1
      visible_trees += 1
    else
      height = map[row][column]
      if ((0..row-1).to_a.all? { |r| map[r][column] < height } ||
        (row+1..max_row).to_a.all? { |r| map[r][column] < height } ||
        (0..column-1).to_a.all? { |c| map[row][c] < height } ||
        (column+1..max_column).to_a.all? { |c| map[row][c] < height })
        visible_trees += 1
      end
    end
    column += 1
  end
  row += 1
end
p visible_trees
