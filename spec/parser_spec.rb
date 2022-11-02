RSpec.describe 'Parser' do
  let(:filename) { 'spec/fixtures/webserver.log' }
  subject(:parser) { `./parser.rb #{filename}` }

  it 'prints the correct output' do
    expect(parser).to eq <<~OUTPUT
      Unique visits:
      /help_page/1 3 unique views
      /about 1 unique views
      /index 1 unique views
      /about/2 1 unique views
      /home 1 unique views
      /contact 1 unique views

      Pageviews:
      /help_page/1 4 visits
      /about 1 visits
      /index 1 visits
      /about/2 1 visits
      /home 1 visits
      /contact 1 visits
    OUTPUT
  end

  context 'when no filename is provided' do
    let(:filename) { nil }

    it 'prints an error message' do
      expect { parser }.to output(/Please provide a filename/).to_stderr_from_any_process
    end
  end

  context 'when the file does not exist' do
    let(:filename) { 'spec/fixtures/nonexistent.log' }

    it 'prints an error message' do
      expect { parser }.to output(/File does not exist/).to_stderr_from_any_process
    end
  end
end
