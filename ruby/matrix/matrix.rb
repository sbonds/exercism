=begin
Turn a single string with embedded newlines containing rows of numbers into
an array. Provide methods for printing rows or columns.

Quick test method:
  $ ruby -I . -e 'require "matrix"; matrix = Matrix.new("9 7\n8 6"); p matrix'

=end

class Matrix
  def initialize(array_text)
    @array_of_arrays = []
    # Turn string into an array of arrays.
    # Two options for this I can think of:
    # 1) Single pass, splitting digits on word boundaries into array elements
    #    and newlines into new sub-arrays
    # 2) Two pass, splitting newlines into an array of strings and then splitting 
    #    each string into digits-on-word-boundaries 
    just_rows = array_text.split(/\n/)
    # The below does not create an array of integers, instead it creates an array of strings
    #    just_rows.each { |rawInputRow| @array_of_arrays << rawInputRow.scan(/\b\d+/).each{ |number| number.to_i } }
    # ... yeah, because I'm not running something on each, I'm mapping each item to something else so I should use "map"
    just_rows.each { |rawInputRow| @array_of_arrays << rawInputRow.scan(/\b\d+/).map{ |number| number.to_i} }
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
