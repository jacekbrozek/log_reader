require 'log'
require 'log_index'
require 'queries/unique_visits'

RSpec.describe Queries::UniqueVisits do
  let(:filename) { 'spec/fixtures/webserver.log' }
  let(:log_reader) { LogReader.new(filename) }
  let(:log) { Log.new(log_reader) }
  let(:log_index) { LogIndex.build(log) }

  subject(:unique_visits) { described_class.new(log_index) }

  describe '#call' do
    it 'returns the unique visits' do
      expect(unique_visits.call).to have(6).items
    end

    it 'returns the unique visits as Array' do
      expect(unique_visits.call).to be_a(Array)
    end

    # [
    #   ["/help_page/1", 3],
    #   ["/contact", 1],
    #   ["/home", 1],
    #   ["/about/2", 1],
    #   ["/index", 1],
    #   ["/about", 1]
    # ]
  end
end
