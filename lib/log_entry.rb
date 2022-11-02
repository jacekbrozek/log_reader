class LogEntry
  def initialize(line)
    @line = line
  end

  def path
    line.split[0]
  end

  def ip
    line.split[1]
  end

  private

  attr_reader :line
end
