require "set"

module Google
  module Taxonomy
    class Validator

      def self.entries(lang = 'de-DE')
        @@entries         ||= {}
        @@entries[lang]   ||= convert_entries(lang)
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

      def self.hashed_entries(lang = 'de-DE')
        split_entries = entries(lang).map {|e| e.split(/ > /)}
        return split_entries.reduce({}) do |hash, entry|
          hash.deep_merge(entry.reverse.inject({}) {|k, v| {v => k}})
        end
      end

      def self.get_next_level(categories = [], hash = hashed_entries())
        if categories.blank?
          return hash
        else
          next_level = hash["#{categories[0]}"]
          if next_level.blank?
            return hash
          else
            get_next_level(categories.drop(1), next_level)
          end
        end
      end
    end
  end
end
