require 'ruby_app_helper'

describe RubyApp::FileParser do
  subject(:parser) { described_class.new(file) }
  let(:file) { 'spec/fixtures/webserver.log' }

  describe '#initialize' do
    let(:file) { 'missing.log' }

    it 'raises an error if file does not exist' do
      expect {
        parser
      }.to raise_error.with_message("Log file does not exist: #{file}")
    end
  end

  describe '#most_views' do
    let(:expected_response) do
      [{ '/help_page/1' => 3 }, { '/home' => 2 }, { '/contact' => 1 }]
    end

    it 'returns correct url views' do
      expect(parser.most_views).to eq(expected_response)
    end
  end

  describe '#uniq_views' do
    let(:expected_response) do
      [{ '/help_page/1' => 2 }, { '/home' => 2 }, { '/contact' => 1 }]
    end

    it 'returns correct url unique views' do
      expect(parser.uniq_views).to eq(expected_response)
    end
  end
end
