require 'log_entry'

RSpec.describe LogEntry do
  let(:line) { '/help_page/1 126.318.035.038' }
  subject(:log_entry) { described_class.new(line) }

  describe '#path' do
    it 'returns the path' do
      expect(log_entry.path).to eq('/help_page/1')
    end
  end

  describe '#ip' do
    it 'returns the ip' do
      expect(log_entry.ip).to eq('126.318.035.038')
    end
  end
end
