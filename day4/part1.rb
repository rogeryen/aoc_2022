contained_count = 0

def first_contained_in_second?(first_range, second_range)
 first_min, first_max = first_range.split("-")
 second_min, second_max = second_range.split("-")

 first_min.to_i >= second_min.to_i && first_max.to_i <= second_max.to_i
end

File.foreach("./input.txt") do |line| 
    first, second = line.split(",")
    if first_contained_in_second?(first, second) || first_contained_in_second?(second, first)
        contained_count += 1
    end 
end

p contained_count