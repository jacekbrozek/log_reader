require 'log_index'

RSpec.describe LogIndex do
  let(:filename) { 'spec/fixtures/webserver.log' }
  let(:log_reader) { LogReader.new(filename) }
  let(:log) { Log.new(log_reader) }
  subject(:log_index) { described_class.build(log) }

  describe '#by_path' do
    it 'returns the by_path' do
      expect(log_index.by_path).to have(6).items
    end

    it 'returns the by_path as Hash' do
      expect(log_index.by_path).to be_a(Hash)
    end

    # {
    #   "/help_page/1" => ["126.318.035.038", "929.398.951.889", "722.247.931.582", "646.865.545.408"],
    #   "/contact" => ["184.123.665.067"],
    #   "/home" => ["184.123.665.067"],
    #   "/about/2" => ["444.701.448.104"],
    #   "/index" => ["444.701.448.104"],
    #   "/about" => ["061.945.150.735"]
    # }
  end

  describe '#by_ip' do
    it 'returns the by_ip' do
      expect(log_index.by_ip).to have(7).items
    end

    it 'returns the by_ip as Hash' do
      expect(log_index.by_ip).to be_a(Hash)
    end

    # {
    #   "126.318.035.038" => ["/help_page/1"],
    #   "184.123.665.067" => ["/contact", "/home"],
    #   "444.701.448.104" => ["/about/2", "/index"],
    #   "929.398.951.889" => ["/help_page/1"],
    #   "722.247.931.582" => ["/help_page/1"],
    #   "061.945.150.735" => ["/about"],
    #   "646.865.545.408" => ["/help_page/1"]
    # }
  end
end
