=begin
Given a word, return a number that describes how it would score in the game Scrabble

The tests don't appear to cover the extended version with word and letter multipliers, so skip that for now.
=end

class Scrabble
  # "new" is used to create an instance that holds the specified word, perhaps with some filters on it
  def initialize(provided_word)
    # Handle provided_word being falsey (e.g. nil) but let the letters method handle the rest of the filtering.
    @word = provided_word || ""
  end

  PER_LETTER_SCORE = {
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
  }.freeze

  def just_letters
    @word.downcase.scan(/[a-z]/).join
  end

  def score
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
    #
    # Mentor ajoshguy suggested a much better method that avoids the use of that var outside the main logic.
    # "Sum" seems like it would have been easy to find, but *sigh* that's why the mentors are here!
    #
    # He also showed me the &PER_LETTER_SCORE trick, not to be confused with the requires-a-horrible-workaround &: trick. :-)
    # https://skorks.com/2013/04/ruby-ampersand-parameter-demystified/
    # "If the parameter is not a Proc, Ruby will try to convert it into one (by calling to_proc on it) before associating it with the method as its block."
    # ... not sure what that means just yet. What is a Proc?
    # https://ruby-doc.org/core-2.5.3/Proc.html
    #
    # You know... I was thinking earlier that there wasn't enough IRB in this exercise. I suspected it was coming! :-)
    # What do various objects look like when hit with .to_proc?
    #   NoMethodError (undefined method `to_proc' for "This is a stringy string":String)
    #   NoMethodError (undefined method `to_proc' for [1, 2, 3, 4, 5]:Array)
    #   >> {'a' => 1, 'b' => 2}.to_proc
    #   => #<Proc:0x00000000028c7060>
    # So strings and arrays can't be Procified, but hashes can.
    # https://stackoverflow.com/questions/38943466/ruby-how-to-use-hashto-proc
    # Oh, like this!
    #   >> sample_hash={'a' => 1, 'b' => 2, 'c' => 3}
    #   => {"a"=>1, "b"=>2, "c"=>3}
    #   >> ['b', 'a'].map(&sample_hash)
    #   => [2, 1]
    # That *is* a pretty neat trick!
    just_letters.each_char.sum(&PER_LETTER_SCORE)
  end

  # The class method needs to create an object and then return the score
  def self.score(provided_word)
    new(provided_word).score
  end
end
  