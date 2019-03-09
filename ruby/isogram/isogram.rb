=begin
Given a word, return a boolean that describes if it has any repeating word letters.
+ true = no letters repeat
+ false = at least one letter repeats
=end

class Isogram
  def self.isogram?(word)
    # Possibly useful tools for this
    # String.chars -> turns the string into an array of characters (use Enumerable methods to find duplicates?)
    # String.count -> check the remainder of the string for another occurance of each character as we go
    # String.scan -> similar usage to the above
    # String.scan -> use the power of regex and backreferences to search for repeated characters
    #
    # That last one sounds somewhat simple, though I may not learn much Ruby in the process since regular expressions
    # tend to be similar across languages. What does IRB say?
    #   >> "slumberjacks".scan(/(\w).*\1/).length >0
    #   => true
    #   >> "lumberjacks".scan(/(\w).*\1/).length >0
    #   => false
    # Go for it. We'll see how it plays out under testing. :-)
    #
    # Well... that's not a good start. The regex method relies on a positive match for something in order to return
    # and a null string doesn't have any repeating characters, but also won't itself repeat. The test only works if
    # there's at least one word character in the string.
    #
    # word.scan(/\w/) ? true : word.scan(/(\w).*\1/i).length > 0
    #
    #   1) Failure:
    #   IsogramTest#test_hypothetical_word_with_duplicated_character_following_hyphen [isogram_test.rb:57]:
    #   Expected false, 'thumbscrew-jappingly' is not an isogram
    # 
    # I would expect the '*' after '.' to mean that zero or more of any characters would be there.
    # Since that includes zero, it seems odd that the above fails. Test in IRB...
    #
    #   >> "lumberjacks".scan(/(\w).*\1/).length >0
    #   => false
    #   >> "lumberrjacks".scan(/(\w).*\1/).length >0
    #   => true
    # 
    # OK, that's what I would expect, so why is "jappingly" not working?
    # /facepalm... I had my logic completely reversed in my brain. Whoops! Another good case for test-driven development!
    #
    # Mentor kiru42 suggests looking into downcase+scan(/[a-z]/) and the .size and .uniq methods on an array.
    # I think .size and .length are interchangable: https://ruby-doc.org/core-2.5.3/Array.html#method-i-size
    # so I'll continue to go with length to keep the other changes clearer.
    # A good use for .uniq would be to compare the uniq word-chars-only length to the original. If they match, it's an isogram!
    word.downcase.scan(/\w/).length == word.downcase.scan(/\w/).uniq.length
  end
end