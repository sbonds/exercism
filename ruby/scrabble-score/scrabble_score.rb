=begin
Given a word, return a number that describes how it would score in the game Scrabble

The tests don't appear to cover the extended version with word and letter multipliers, so skip that for now.
=end

class Scrabble
  # "new" is used to create an instance that holds the specified word, perhaps with some filters on it
  def initialize(provided_word)
    # Filter the word to remove non-Scrabble-compliant characters.
    @word = just_letters(provided_word) || ""
  end

  def just_letters(dirty_word)
    # The ternary handles Nil, which causes an exception if used with downcase
    dirty_word ? dirty_word.downcase.scan(/[a-z]/).join : ""
  end

  def score
    # The word should be normalized so we can index by lowercase letters only. Scrable scores don't really follow
    # much in the way of patterns, so a lookup for each letter seems justified. The other way to do this would be
    # to index by score with a list of letters matching that score. That seems to make the lookup more difficult.
    letter_score_for = {
      'a' => 1,
      'b' => 3,
      'c' => 3,
      'd' => 2,
      'e' => 1,
      'f' => 4,
      'g' => 2,
      'h' => 4,
      'i' => 1,
      'j' => 8,
      'k' => 5,
      'l' => 1,
      'm' => 3,
      'n' => 1,
      'o' => 1,
      'p' => 3,
      'q' => 10,
      'r' => 1,
      's' => 1,
      't' => 1,
      'u' => 1,
      'v' => 4,
      'w' => 4,
      'x' => 8,
      'y' => 4,
      'z' => 10,
    }
    # I didn't see a way to do something like each_with_object to eliminate the need for a var outside the
    # main logic.
    # 
    # All tests pass except:
    #   1) Error:
    #   ScrabbleTest#test_convenient_scoring:
    #   NoMethodError: undefined method `score' for Scrabble:Class
    #   scrabble_score_test.rb:46:in `test_convenient_scoring'
    # 
    # Ah, they're not calling new() like I expected based on the first tests. Let me toss in a "convenient" class method.
    word_score = 0
    @word.each_char{ |letter| word_score += letter_score_for[letter] }
    return word_score
  end

  # The class method needs to create an object and then return the score
  def self.score(provided_word)
    new(provided_word).score
  end
end
  