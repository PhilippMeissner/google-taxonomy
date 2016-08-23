# GoogleTaxonomy

A gem to help you with the google taxonomy. Supports DE, GB, US and NL taxonomies at the moment.

## Installation

Add this line to your application's Gemfile:

    gem 'google-taxonomy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google-taxonomy

## Usage

    Google::Taxonomy::Validator.valid?("Baby & Kleinkind")
    #=> true

    Google::Taxonomy::Validator.valid?("Captain Kirk")
    #=> false

    Google::Taxonomy::Parser.hashed_entries('de-DE')
    # => {"Baby & Kleinkind"=> {"Baby Badebedarf"=>{"Babybadewannen"=>{} .. }}}

    Google::Taxonomy::Parser.get_next_level('de-DE', ["Baby & Kleinkind", "Baby Badebedarf"])
    # => {"Babybadewannen"=>{}, "Shampoo-Schutzschilder"=>{}}
