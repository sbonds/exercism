=begin

Here's what the tests show on a blank acronym.rb file

    1) Error:
  AcronymTest#test_basic:
  NameError: uninitialized constant AcronymTest::Acronym
  Did you mean?  AcronymTest
      acronym/acronym_test.rb:8:in `test_basic'

The test file shows it calling:

  Acronym.abbreviate(phrase)

A classic case of string splitting. To the Google!

https://stackoverflow.com/questions/7622369/ruby-extracting-words-from-string

Regex match on Word characters using the split method sounds like a good plan!

Take each word...

Take the first letter of each word...

Convert to upper case and let it return.

  phrase.split(/\W+/).each.first.upcase

Didn't do what I hoped it would. :-)

  SSSS"Portable Network Graphics"
  ["Portable", "Network", "Graphics"]
  #<Enumerator: ["Portable", "Network", "Graphics"]:each>
  "Portable"
  FSS

  Finished in 0.001191s, 5877.8483 runs/s, 839.6926 assertions/s.

    1) Failure:
  AcronymTest#test_basic [acronym/acronym_test.rb:8]:
  Expected: "PNG"
    Actual: "PORTABLE"

Ah, 'each' needs to be called in a loop so it's not quite as simple as a one-liner.

  phrase.split(/\W+/).each do |word|

Is a good start. I'll build up a string of uppercase letters using the method here:

https://stackoverflow.com/questions/39162489/assign-string-if-variable-is-nil-and-append-otherwise

Now I get:

    1) Failure:
  AcronymTest#test_basic [acronym/acronym_test.rb:8]:
  --- expected
  +++ actual
  @@ -1 +1 @@
  -"PNG"
  +["Portable", "Network", "Graphics"]

I don't quite follow how the whole array gets sent back.

Forget the implied return, guess I need to make it explicit.

=end

class Acronym
  def self.abbreviate(phrase)
    # Here's a good way to get fancy with regexps on a string:
    # https://ruby-doc.org/core-2.5.3/String.html#method-i-scan
    # https://ruby-doc.org/core-2.5.3/Regexp.html
    # Look for the first word character (\w) after a word boundary (\b)
    # and then upcase it before adding it to our initialism
    # Get fancy with "map"
    # https://stackoverflow.com/questions/5254128/arrayeach-vs-arraymap
    # 
    # So the map isn't even needed since scan returns an array of its
    # matches. Once merger into a single string via join the whole thing
    # can be upcased instead of a character at a time.
    #
    # So much work crammed into one tiny line of code!
    phrase.scan(/\b\w/).join.upcase
  end
end