require 'ruby_app_helper'
require 'byebug'

describe RubyApp do
  describe '.execute' do
    let(:log_file) { 'spec/fixtures/webserver.log' }
    let(:most_views) { [{ '/help_page/1' => 3 }, { '/home' => 2 }, { '/contact' => 1 }] }
    let(:uniq_views) { [{ '/help_page/1' => 2 }, { '/home' => 2 }, { '/contact' => 1 }] }

    it 'prints total views stats' do
      most_views.each do |entry|
        line = /#{entry.keys.first} #{entry.values.first} visits \n/
        expect {
          RubyApp.execute([log_file])
        }.to output(line).to_stdout
      end
    end

    it 'prints unique views stats' do
      uniq_views.each do |entry|
        line = /#{entry.keys.first} #{entry.values.first} unique views \n/
        expect {
          RubyApp.execute([log_file])
        }.to output(line).to_stdout
      end
    end

    context 'when log file is not supplied' do
      it 'raises an error' do
        expect {
          RubyApp.execute([])
        }.to raise_error.with_message('Log file missing')
      end
    end
  end
end
