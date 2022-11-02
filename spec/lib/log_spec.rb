require 'log'

RSpec.describe Log do
  let(:filename) { 'spec/fixtures/webserver.log' }
  let(:log_reader) { LogReader.new(filename) }
  subject(:log) { described_class.new(log_reader) }

  describe '#entries' do
    it 'returns the entries' do
      expect(log.entries).to have(9).items
    end

    it 'returns the entries as LogEntry' do
      expect(log.entries).to all(be_a(LogEntry))
    end
  end
end
