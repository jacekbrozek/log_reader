require_relative 'log_entry'

class Log
  def initialize(log_reader)
    @log_reader = log_reader
  end

  def entries
    @entries ||= @log_reader.map do |line|
      LogEntry.new(line)
    end
  end

  private

  attr_reader :log_reader
end
