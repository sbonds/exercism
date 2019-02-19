=begin
Turn a single string with embedded newlines containing rows of numbers into
an array. Provide methods for printing rows or columns.

Current error:

  1) Error:
MatrixTest#test_extract_a_row:
NoMethodError: undefined method `scan' for #<Enumerator: ["\n"]:each>
    C:/Users/sbonds/Exercism/ruby/matrix/matrix.rb:15:in `initialize'
    matrix_test.rb:6:in `new'
    matrix_test.rb:6:in `test_extract_a_row'

=end

class Matrix
  def initialize(array_text)
    # Turn string into an array of arrays.
    # Two options for this I can think of:
    # 1) Single pass, splitting digits on word boundaries into array elements
    #    and newlines into new sub-arrays
    # 2) Two pass, splitting newlines into an array of strings and then splitting 
    #    each array into digits-on-word-boundaries 
    just_rows = array_text.scan(/\n/)
    @array_of_arrays << just_rows.each.scan(/\b\d+/)
  end

  def rows(rownum)
    @array_of_arrays[rownum]
  end

  def columns(rownum)
    @array_of_arrays.each[rownum]
  end
end
