require "./file_system_explorer"

file_system_explorer = FileSystemExplorer.new("./input.txt")
file_system_explorer.process
p file_system_explorer.min_folder_size_to_delete(30000000)
