cycle = 0
position = 0
x = 1
row = []

File.foreach("./input.txt") do |line|
  line.delete!("\n")
  command = line.split
  case command[0]
  when "noop"
    process_cycles = 1
    value = 0
  when "addx"
    process_cycles = 2
    value = command[1].to_i
  end

  process_cycles.times do
    cycle += 1

    if (x-position).abs <= 1
      row << "#"
    else
      row << "."
    end

    position += 1

    if cycle % 40 == 0
      p row.join
      row = []
      position = 0
    end
  end
  x += value
end

p signal_strength_sum
