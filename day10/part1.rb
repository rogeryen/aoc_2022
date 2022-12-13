cycle = 0
signal_strength_sum = 0
x = 1
CYCLES = [20, 60, 100, 140, 180, 220]

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
    if CYCLES.include? cycle
      signal_strength_sum += cycle * x
    end
  end
  x += value
end

p signal_strength_sum
