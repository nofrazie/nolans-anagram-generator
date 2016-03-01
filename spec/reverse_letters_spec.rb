require 'rspec'
require_relative '../app/models/word.rb'

describe "#reverse_letters" do
  let(:letters) { ['a','b'] }

  it "takes an array of letters" do
    expect {
      Word.reverse_letters(letters)
    }.not_to raise_error
  end

  it "returns an array of letters" do
    expect(Word.reverse_letters(letters)).to be_a(Array)
  end

  it "returns the letters in reverse" do
    expect(Word.reverse_letters(letters)).to eq(['b','a'])
  end

  it "returns an array of length 2" do
    expect(Word.reverse_letters(letters).length).to eq(2)
  end
end
