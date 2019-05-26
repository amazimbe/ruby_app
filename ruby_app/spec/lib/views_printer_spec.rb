require 'ruby_app_helper'

describe RubyApp::ViewsPrinter do
  describe '.print_entries' do
    let(:entries) do
      [{ '/help_page/1' => 3 }, { '/contact' => 1 }, { '/home' => 2 }]
    end

    let(:operation) { 'visits' }
    let(:header) { '> web pages with most views in descending order' }

    it 'prints entries to stdout' do
      entries.each do |entry|
        line = /#{entry.keys.first} #{entry.values.first} #{operation} \n/
        expect {
          described_class.print_entries(entries, header, operation)
        }.to output(line).to_stdout
      end
    end
  end
end
