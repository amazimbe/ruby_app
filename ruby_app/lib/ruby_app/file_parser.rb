require 'set'
require 'byebug'

module RubyApp
  class FileParser
    attr_reader :log_file, :entries

    def initialize(log_file)
      raise "Log file does not exist: #{log_file}" unless File.exists?(log_file)
      @log_file = log_file
      @entries = Hash.new { |hash, key| hash[key] = {} }
    end

    def most_views
      @most_views ||= parse.map { |url, value| { url => value[:total_views] } }
    end

    def unique_views
      @unique_views ||= parse.map { |url, value| { url => value[:viewers].length } }
    end

    private

    def parse
      return entries if entries.any?

      File.open(log_file).each do |line|
        url, ip = *line.split

        if entries.key?(url)
          entries[url][:total_views] += 1
          entries[url][:viewers] << ip
        else
          entries[url] = { total_views: 1, viewers: Set[ip] }
        end
      end
      entries
    end
  end
end
