class Word < ActiveRecord::Base
  before_save :add_letters

  def add_letters
    characters = self.text.chars
    alphabetized_characters = characters.sort
    self.letters = alphabetized_characters.join
  end

  def self.find_anagrams(string)
    combinations = string.split("").permutation.map {|i| i.join}

    anagrams = []
    combinations.each do |combo|
      if Word.find_by_text(combo).present?
        anagrams << combo
      end
    end

    anagrams
  end

  def self.reverse_letters(letters)
    length = letters.length
    reversed_letters = Array.new(length)

    letters.each_with_index do |letter, index|
      reversed_letters[length - index - 1] = letter
    end

    reversed_letters
  end
end
