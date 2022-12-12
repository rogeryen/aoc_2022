map = {"0,0": 1}
knots = []
10.times {knots << [0,0]}

def head_nearby_tail?(head, tail)
  if (head[0] - tail[0]).abs > 1 || (head[1] - tail[1]).abs > 1
    false
  else
    true
  end
end

File.foreach("./input.txt") do |line|
  line.delete!("\n")
  direction, steps = line.split
  steps.to_i.times do
      case direction
      when "R"
        knots[0][0] += 1
      when "U"
        knots[0][1] += 1
      when "D"
        knots[0][1] -= 1
      when "L"
        knots[0][0] -= 1
      end

    (1..knots.length-1).each do |v|
      head = knots[v-1]
      tail = knots[v]

      unless head_nearby_tail?(head, tail)
        # head is to the right of tail
        if head[0] > tail[0]
          # head is above tail
          if head[1] > tail[1]
            tail[0] += 1
            tail[1] += 1
          # same y value
          elsif head[1] == tail[1]
            tail[0] += 1
          else
          # head is below tail
            tail[0] += 1
            tail[1] -= 1
          end
        # same x value
        elsif head[0] == tail[0]
          # head is above tail
          if head[1] > tail[1]
            tail[1] += 1
          # head is below tail
          else
            tail[1] -= 1
          end
        # head is to the left of tail
        else
          # head is above tail
          if head[1] > tail[1]
            tail[0] -= 1
            tail[1] += 1
          # same y value
          elsif head[1] == tail[1]
            tail[0] -= 1
          # head is below tail
          else
            tail[0] -= 1
            tail[1] -= 1
          end
        end

        if v == knots.length-1
          map[tail.join(",")] ||= 0
          map[tail.join(",")] += 1
        end
      end
    end
  end
end
sum = 0
map.values.each { |v| sum += 1 if v >= 1}
p sum