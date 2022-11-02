require 'log_reader'

RSpec.describe LogReader do
  let(:filename) { 'spec/fixtures/webserver.log' }
  subject(:log_reader) { described_class.new(filename) }

  describe '#map' do
    it 'yields each line' do
      expect { |b| log_reader.map(&b) }.to yield_control.exactly(9).times
    end
  end
end
