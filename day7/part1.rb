require "./file_system_explorer"

file_system_explorer = FileSystemExplorer.new("./input.txt")
file_system_explorer.process

filesize_sum = file_system_explorer.folders.values.reduce(0) do |sum, n|
  n <= 100000 ? sum + n : sum
end
p filesize_sum
