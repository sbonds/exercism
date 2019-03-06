=begin
Turn a single string with embedded newlines containing rows of numbers into
an array. Provide methods for printing rows or columns.

Quick test method:
  $ ruby -I . -e 'require "matrix"; matrix = Matrix.new("9 7\n8 6"); p matrix'

=end

class Matrix
  def initialize(array_text)
    # Turn string into an array of arrays.
    # Options for this I can think of:
    # 1) Single pass, splitting digits on word boundaries into array elements
    #    and newlines into new sub-arrays
    # 2) Two pass, splitting newlines into an array of strings and then splitting 
    #    each string into digits-on-word-boundaries 
    # 3) Use some Ruby library call to do lots of things at once
    #
    # The below does not create an array of integers, instead it creates an array of strings
    #    just_rows.each { |rawInputRow| @array_of_arrays << rawInputRow.scan(/\b\d+/).each{ |number| number.to_i } }
    # ... yeah, because I'm not running something on each, I'm mapping each item to something else so I should use "map"
    #
    # Mentor kiru42 suggested I look at the String.lines or String.each_line method.
    #  https://ruby-doc.org/core-2.5.3/String.html
    #
    # Wow, OK. That took me on a big tour of Ruby, which is great. That's what mentors are for and a huge
    # advantage of Exercism over other self-paced learning methods. The interactive Ruby browser was
    # super helpful in exploring how the methods behave. For example:
    #   >> "1 2\n3 4\n5 6\n".each_line
    #   => #<Enumerator: "1 2\n3 4\n5 6\n":each_line>
    #
    # https://ruby-doc.org/core-2.5.3/Enumerator.html
    # Included modules: Enumerable https://ruby-doc.org/core-2.5.3/Enumerable.html
    # Wow, that's a lot of methods!
    # Possibly useful:
    # + to_a: shoves each item in the Enumerator into an array
    # + each_entry{ |obj| block }: perform block on obj for each item in the Enumerator
    # + various slice entries
    #
    #   >> "1 2\n3 4\n5 6\n".each_line.to_a
    #   => ["1 2\n", "3 4\n", "5 6\n"]
    #   >> "1 2\n3 4\n5 6\n".each_line(chomp:true).to_a
    #   => ["1 2", "3 4", "5 6"]
    # (the below doesn't work as expected)
    #   >> "1 2\n3 4\n5 6\n".each_line(chomp:true).each_entry{ |s| s.scan(/\b\d+/)}
    #   => #<Enumerator: "1 2\n3 4\n5 6\n":each_line({:chomp=>true})>
    # I expected scan() to return an array with each match, splitting the rows on spaces into arrays.
    #   >> "1 2\n3 4\n5 6\n".each_line(chomp:true).each_entry{ |s| s.split(/\b\d+/)}
    #   => #<Enumerator: "1 2\n3 4\n5 6\n":each_line({:chomp=>true})>
    # Same return? Maybe each_entry isn't doing what I expect... Try map, my old buddy...
    #   >> "1 2\n3 4\n5 6\n".each_line(chomp:true).map{ |s| s.scan(/\b\d+/) }
    #   => [["1", "2"], ["3", "4"], ["5", "6"]]
    # Closer! As before, I have an array of single character strings now, not integers.
    # Turn it into integers:
    #   >> "1 2\n3 4\n5 6\n".each_line(chomp:true).map{ |s| s.scan(/\b\d+/).to_i }
    #   NoMethodError (undefined method `to_i' for ["1", "2"]:Array)
    # Can't do the whole array that way. How do we map array values to something else? map again!
    #   >> "1 2\n3 4\n5 6\n".each_line(chomp:true).map{ |s| s.scan(/\b\d+/).map{ |s2| s2.to_i } }
    #   => [[1, 2], [3, 4], [5, 6]]
    #
    # More feedback from kiru42: look at split and the block shortcut "&:"
    # https://stackoverflow.com/questions/1217088/what-does-mapname-mean-in-ruby
    #   >> "1 2\n3 4\n5 6\n".each_line.map{ |whole_line| whole_line.split }
    #   => [["1", "2"], ["3", "4"], ["5", "6"]]
    #   >> "1 2\n3 4\n5 6\n".each_line.map{ |whole_line| whole_line.split.map(&:to_i) }
    #   => [[1, 2], [3, 4], [5, 6]]
    @array_of_arrays = array_text.each_line.map{ |whole_line| whole_line.split.map(&:to_i) }
  end

  def rows
    @array_of_arrays
  end

  def columns
    # Wow, Ruby has everything!
    # https://ruby-doc.org/core-2.5.3/Array.html#method-i-transpose
    @array_of_arrays.transpose
  end
end
