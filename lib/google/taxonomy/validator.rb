require "set"

module Google
  module Taxonomy
    class Validator

      def self.entries(lang = 'de-DE')
        @@entries ||= convert_entries(lang)
      end

      def self.convert_entries(lang = 'de-DE')
        entries = []
        File.open(file_location(lang), "r").each_with_index do |line, index|
          next if index == 0
          entries << line.gsub("\n", "")
        end
        entries.to_set
      end

      def self.file_location(lang = 'de-DE')
        File.expand_path("../../data_files/taxonomy.#{lang}.txt", File.dirname(__FILE__))
      end

      def self.valid?(val, lang = 'de-DE')
        entries(lang).include? val
      end

    end
  end
end
