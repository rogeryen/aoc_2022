require './crate_mover.rb'

crate_mover = DayFive::CrateMover.new
crate_mover.process_instructions(false)
top = crate_mover.stacks.map { |stack| stack[0] }
p top.join