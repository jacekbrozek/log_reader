class LogIndex
  def initialize(log)
    @log = log
  end

  attr_reader :by_path, :by_ip

  def self.build(log)
    self.new(log).tap do |index|
      index.by_path!
      index.by_ip!
    end
  end

  def by_path!
    @by_path ||= log.entries.each_with_object({}) do |entry, hash|
      hash[entry.path] ||= []
      hash[entry.path] << entry.ip
    end
  end

  def by_ip!
    @by_ip ||= log.entries.each_with_object({}) do |entry, hash|
      hash[entry.ip] ||= []
      hash[entry.ip] << entry.path
    end
  end

  private

  attr_reader :log
end
