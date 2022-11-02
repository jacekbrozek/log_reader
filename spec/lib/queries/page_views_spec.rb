require 'log'
require 'log_index'
require 'queries/page_views'

RSpec.describe Queries::PageViews do
  let(:filename) { 'spec/fixtures/webserver.log' }
  let(:log_reader) { LogReader.new(filename) }
  let(:log) { Log.new(log_reader) }
  let(:log_index) { LogIndex.build(log) }

  subject(:page_views) { described_class.new(log_index) }

  describe '#call' do
    it 'returns the page views' do
      expect(page_views.call).to have(6).items
    end

    it 'returns the page views as Array' do
      expect(page_views.call).to be_a(Array)
    end

    # [
    #   ["/help_page/1", 4],
    #   ["/contact", 1],
    #   ["/home", 1],
    #   ["/about/2", 1],
    #   ["/index", 1],
    #   ["/about", 1]
    # ]
  end
end
