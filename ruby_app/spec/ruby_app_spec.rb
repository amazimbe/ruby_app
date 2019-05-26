require 'ruby_app_helper'

describe RubyApp do
  describe '.execute' do
    let(:log_file) { 'fixtures/webserver.log' }

    let(:expected_response) do
      [
        '/help_page/1' => 3,
        '/home' => 2,
        '/contact' => 1,
      ]

      # /help_page/1 126.318.035.038
      # /contact 184.123.665.067
      # /home 184.123.665.067
      # /about/2 444.701.448.104
      # /help_page/1 929.398.951.889
      # /help_page/1 722.247.931.582
      # /home 235.313.352.950
    end

    before { ARGV = [log_file] }

    it 'prints the number of visits to urls in descending order' do
      expect(RubyApp.execute).to eq(expected_response)
    end

    context 'when log file is not supplied' do
      before { ARGV = [] }

      it 'raises an error' do
        expect {
          RubyApp.execute
        }.to raise_error.with_message('Log file missing')
      end
    end
  end
end
