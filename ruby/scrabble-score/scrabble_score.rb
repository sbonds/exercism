=begin
Given a word, return a number that describes how it would score in the game Scrabble

The tests don't appear to cover the extended version with word and letter multipliers, so skip that for now.
=end

class Scrabble
  # "new" is used to create an instance that holds the specified word, perhaps with some filters on it
  def initialize(provided_word)
    @word = provided_word.downcase.scan(/[a-z]/)
  end

  def score
    return @word.length
  end
end
  