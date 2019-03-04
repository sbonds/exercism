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
    just_rows.each { |number| @array_of_arrays << number.scan(/\b\d+/) }
  end

  def rows(rownum)
    @array_of_arrays[rownum]
  end

  def columns(columnnum)
    @array_of_arrays.each[columnnum]
  end
end
