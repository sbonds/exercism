=begin
Create a method "slices(n)" that returns all the groups of numbers that are "n" length long.

If "n" is larger than the size of the series object's array, return an ArgumentError

=end

class Series
  def initialize(string_of_numbers)
    @string_of_numbers = string_of_numbers
  end

  def slices(group_size)
    if group_size > @string_of_numbers.length
      raise ArgumentError.new("Length requested (#{group_size}) must be equal or longer than #{@string_of_numbers.length}")
    end
    # Find an Enumerable method that seems to return what we want.
    # https://ruby-doc.org/core-2.5.3/Enumerable.html#method-i-chunk_while
    # chunk_while looks promising
    # each_cons looks even more promising, try IRB!
    #   >> "123456".each_char.each_cons(1).to_a
    #   => [["1"], ["2"], ["3"], ["4"], ["5"], ["6"]]
    #   >> "123456".each_char.each_cons(2).to_a
    #   => [["1", "2"], ["2", "3"], ["3", "4"], ["4", "5"], ["5", "6"]]
    # Promising indeed!
    # But how to convert
    #   => [["1", "2"], ["2", "3"], ["3", "4"], ["4", "5"], ["5", "6"]]
    # into
    #   => ["12", "23", "34", "45", "56"]
    # Ah! Any time I need to change a bunch of things in an array to something almost the same
    # I should think about "map". "join" merges an array into a string, so use that on each
    # element using the handy ampersand shortcut I learned last lesson:
    #   >> "123456".each_char.each_cons(2).map(&:join)
    #   => ["12", "23", "34", "45", "56"]
    @string_of_numbers.each_char.each_cons(group_size).map(&:join)
  end
end