class Word < ActiveRecord::Base
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
    # create a new array of 2 items
    length = letters.length
    reversed_letters = Array.new(length)

    # loop through letters and keep index
    letters.each_with_index do |letter, index|
      reversed_letters[length - index - 1] = letter
    end

    reversed_letters
  end
end
