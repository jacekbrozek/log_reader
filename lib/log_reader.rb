class LogReader < Struct.new(:file)
  def map
    each_line.map { |line| yield line }
  end

  private

  def each_line
    File.open(file).each_line
  end
end
