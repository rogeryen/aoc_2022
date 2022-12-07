module DayFive
    class CrateMover
        attr_accessor :stacks
        def initialize
            @stacks = []
            File.foreach("./input.txt") do |line| 
                if line == "\n"
                    next
                end

                if line.include? "move"
                    next
                end

                line.delete!("\n")
                line << " "

                crates = line.scan(/.{4}/)
                if stacks.empty?
                    crates.length.times { stacks << [] }
                end

                crates.each_with_index do |crate, i|
                    crate.strip!
                    unless crate.empty? || crate.length != 3
                        stacks[i] << crate[1]
                    end
                end
            end
        end

        def process_instructions(crate_mover_9000 = true)
            File.foreach("./input.txt") do |line|
                unless line.start_with?("move")
                    next
                end
                # @stacks.each { |stack| p stack.join(",") }
                # puts "\n"
                count, from, to = line.scan(/move (\d+) from (\d+) to (\d+)/).to_a.flatten
                # p "#{from}, #{to}, #{count}"
                to_move = stacks[from.to_i - 1].shift(count.to_i)
                to_move.reverse! if crate_mover_9000
                @stacks[to.to_i - 1].unshift(*to_move)
                # @stacks.each { |stack| p stack.join(",") }
                # puts "\n"
            end
        end
    end
end