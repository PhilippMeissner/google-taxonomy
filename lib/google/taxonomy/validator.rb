require "set"

module Google
  module Taxonomy
    class Validator

      def self.entries
        @@entries ||= convert_entries
      end

      def self.convert_entries
        entries = []
        File.open(file_location, "r").each_with_index do |line, index|
          next if index == 0
          entries << line.gsub("\n", "")
        end
        entries.to_set
      end

      def self.file_location
        "#{Dir.pwd}/lib/data_files/taxonomy.de-DE.txt"
      end

      def self.valid?(val)
        entries.include? val
      end

    end
  end
end
