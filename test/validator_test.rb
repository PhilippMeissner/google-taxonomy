require "test_helper"

describe Google::Taxonomy::Validator do
  it "returns the file location" do
    assert Google::Taxonomy::Validator.file_location
  end

  it "converts the entries to an array" do
    converted = Google::Taxonomy::Validator.convert_entries
    assert converted.is_a?(Set)
    assert converted.length > 1
  end

  it "may not include the file header" do
    refute Google::Taxonomy::Validator.valid?("# Google_Product_Taxonomy_Version: 2013-12-12")
  end

  it "checks if is valid" do
    refute Google::Taxonomy::Validator.valid?("Foo")
    assert Google::Taxonomy::Validator.valid?("Baby & Kleinkind")
  end

end
