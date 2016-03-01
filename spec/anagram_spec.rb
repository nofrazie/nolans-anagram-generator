require 'rspec'
require_relative '../app/models/word.rb'

describe "#find_anagrams" do
  let(:word) { "abc" }

  it "takes a string" do
    expect {
      Word.find_anagrams(word)
    }.not_to raise_error
  end

  it "returns an array" do
    expect(Word.find_anagrams(word)).to be_a(Array)
  end

  it "returns the correct results" do
    expect(Word.find_anagrams(word)).to match_array(
      %w(abc acb bac bca cab cba)
    )
  end
end
