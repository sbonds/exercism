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
    word.scan(/\w/) ? true : word.scan(/(\w).*\1/).length > 0
  end
end