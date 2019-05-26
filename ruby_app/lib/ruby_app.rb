require_relative 'ruby_app/file_parser'
require_relative 'ruby_app/views_printer'

module RubyApp
  def self.execute
    raise 'Log file missing' if ARGV.empty?
    #RubyApp::FileParser.new(ARGV[0]).execute
  end

  execute
end
