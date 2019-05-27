require_relative 'ruby_app/file_parser'
require_relative 'ruby_app/views_printer'

module RubyApp
  def self.execute(args)
    raise 'Log file missing' if args.empty?
    parser = RubyApp::FileParser.new(args[0])
    ViewsPrinter.print_entries(parser.most_views, '> most visits (desc)', 'visits')
    ViewsPrinter.print_entries(parser.uniq_views, '> uniq visits (desc)', 'unique views')
  end

  if $PROGRAM_NAME.end_with?('parser.rb')
    execute(ARGV)
  end
end
