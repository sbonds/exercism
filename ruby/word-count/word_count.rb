=begin

Create a class "Phrase" with a method "word_count" that counts the number of identical (case insensitive?)
words in a string.

=end

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    # I'm sure I saw something like a count-all-the-things example in my recent "series" exercise's
    # tour through Enumerable. Go look again at https://ruby-doc.org/core-2.5.3/Enumerable.html
    # Hmmm... nope. Didn't see that there. Maybe String, the other place I was reading?
    # Nope. Look harder in Enumerable... what looks the most familiar?
    #  chunk
    # Ugh, how did I miss that the first (not gonna say) times?
    # The block in the chunk would be a lookup into an "already seen" array (or Hash) to identify
    # if the word was already seen.
    # Off to play with IRB!
    #  >> "Bob bub boob blob bob".split
    #  => ["Bob", "bub", "boob", "blob", "bob"]
    #  >> "Bob bub boob blob bob".downcase.split.chunk { |word| count[word]++ }
    #  Traceback (most recent call last):
    #  1: from C:/Ruby25-x64/bin/irb.cmd:19:in `<main>'
    #  SyntaxError ((irb):19: syntax error, unexpected '}')
    #  ....chunk { |word| count[word]++ }
    #  >> "Bob bub boob blob bob".downcase.split.chunk { |word| word }.to_a
    #  => [["bob", ["bob"]], ["bub", ["bub"]], ["boob", ["boob"]], ["blob", ["blob"]], ["bob", ["bob"]]]
    #
    # Hmm... not working as expected. From "Enumerable":
    #  This method is especially useful for **sorted** series of elements. 
    # If it needs to be used on sorted series, try sorting first :-)
    #  >> "Bob bub boob blob bob".downcase.split.sort.chunk { |word| word }.to_a
    #  => [["blob", ["blob"]], ["bob", ["bob", "bob"]], ["boob", ["boob"]], ["bub", ["bub"]]]
    #                                   ^^^^^^^^^^^^
    #  >> count=Hash.new(0);  "Bob bub boob blob bob".downcase.split.sort.chunk{ |word| count[word]+= 1 }.to_h
    #  => {1=>["boob", "bub"], 2=>["bob"]}
    #
    # It seems like the key/value arrangement is swapped there.
    #  >> count["bob"]
    #  => 2
    #  >> count["bub"]
    #  => 1
    #  >> count["bac"]
    #  => 0
    # Guess that's just an effect of the to_h, The hash itself seems to have the right values for the right keys
    #
    # Or maybe not... 
    #  @phrase.downcase.split.sort.chunk{ |word| count[word]+= 1}.to_h
    # fails the test with something familiar:
    #  Expected: {"word"=>1}
    #  Actual: {1=>["word"]}
    #
    # I don't think chunk is doing what I think it's doing. Perhaps it's time to fall back on a more
    # traditional loop and see what the Ruby mentors have to say might be a better way.
    #  >> count=Hash.new(0);"Bob bub boob blob bob".downcase.split.each{ |word| count[word]+=1 }
    #  => ["bob", "bub", "boob", "blob", "bob"]
    #  >> p count
    #  {"bob"=>2, "bub"=>1, "boob"=>1, "blob"=>1}
    count=Hash.new(0)
    @phrase.downcase.split.sort.each{ |word| count[word]+= 1}
    return count
  end
end

# Questions remaining:
#  What does "elt" in the Enumberable documentation for chunk() stand for?