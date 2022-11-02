module Queries
  class PageViews
    def initialize(index)
      @index = index
    end

    def call
      counts.sort_by { |path, count| count }.reverse
    end

    private

    attr_reader :index

    def counts
      index.by_path.map do |path, ips|
        [path, ips.count]
      end
    end
  end
end
