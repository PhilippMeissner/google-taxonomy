# GoogleTaxonomy

A gem to help you with the google taxonomy. Only works for German currently.

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
