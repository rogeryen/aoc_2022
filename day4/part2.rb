overlaps = 0

def first_overlap_second?(first_range, second_range)
 first_min, first_max = first_range.split("-")
 first = [*first_min.to_i..first_max.to_i]
 second_min, second_max = second_range.split("-")
 second = [*second_min.to_i..second_max.to_i]

 (first & second).any?
end

File.foreach("./input.txt") do |line| 
    first, second = line.split(",")
    if first_overlap_second?(first, second)
        overlaps += 1
    end 
end

p overlaps