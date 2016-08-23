module Google
  module Taxonomy
    class Parser < Validator

      def self.hash(lang = 'de-DE')
        @@hash       ||= {}
        @@hash[lang] ||= hashed_entries(lang)
      end

      def self.hashed_entries(lang = 'de-DE')
        split_entries = entries(lang).map {|e| e.split(/ > /)}
        return split_entries.reduce({}) do |hash, entry|
          hash.deep_merge(entry.reverse.inject({}) {|k, v| {v => k}})
        end
      end

      def self.get_next_level(categories = [], lang = 'de-DE', hash = hash(lang))
        if categories.blank?
          return hash.keys
        else
          next_level = hash["#{categories[0]}"]
          if next_level.blank?
            return next_level.nil? ? "Error. The category #{categories[0]} was not found!" : next_level.keys
          else
            get_next_level(categories.drop(1), lang, next_level)
          end
        end
      end
    end
  end
end
