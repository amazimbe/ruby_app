module RubyApp
  class ViewsPrinter
    def self.print_entries(entries, header, operation)
      puts header

      entries.each do |entry|
        puts "#{entry.keys.first} #{entry.values.first} #{operation} "
      end
    end
  end
end
