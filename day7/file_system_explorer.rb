class FileSystemExplorer
  DISK_SPACE = 70000000
  REQUIRED_SPACE = 30000000

  attr_reader :folders

  def initialize(log_file)
    @log_file = log_file
    @folders = {}
    @folder_stack = []
  end

  def process
    File.foreach(@log_file) do |line|
      line.delete!("\n")
      if line == "$ cd .."
        @folder_stack.pop
      elsif line.match?(/\$ cd (.+)/)
        folder = line[5..line.length-1]
        full_path = (@folder_stack + [folder]).join(",")
        @folder_stack << full_path
        @folders[full_path] = 0 unless @folders.key?(full_path)
      elsif line.match(/\d+ *./)
        size, file = line.split
        all_full_paths = []
        @folder_stack.each { |f| @folders[f] += size.to_i}
      end
    end
  end

  def min_folder_size_to_delete(required_space)
    @folders.values.sort.each do |size|
      if current_disk_space + size >= required_space
        return size
      end
    end
  end

  private

  def current_disk_space
    DISK_SPACE - folders["/"]
  end
end
