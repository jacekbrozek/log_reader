#!/usr/bin/ruby

require_relative './lib/log_reader'
require_relative './lib/log'
require_relative './lib/log_index'
require_relative './lib/queries/unique_visits'
require_relative './lib/queries/page_views'

filename = ARGV[0]
unless filename
  STDERR.puts 'Please provide a filename'
  exit(1)
end

unless File.exist?(filename)
  STDERR.puts 'File does not exist'
  exit(1)
end

log_reader = LogReader.new(filename)
log = Log.new(log_reader)
index = LogIndex.build(log)

unique_visits = Queries::UniqueVisits.new(index)
page_views = Queries::PageViews.new(index)

puts 'Unique visits:'
unique_visits.call.each do |path, count|
  puts "#{path} #{count} unique views"
end

puts "\nPageviews:"
page_views .call.each do |path, count|
  puts "#{path} #{count} visits"
end
