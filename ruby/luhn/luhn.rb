=begin
Given a series of 2 or more numbers, find if it is valid using a Luhn checksum.

Every digit at an even position (starting at 0 and 0 is even for this purpose) is doubled
+ doubles > 9 get 9 subtracted

Sum the doubled digits with the non-doubled digits.

If the sum is evenly divisible by 10, then the Luhn checksum is valid

=end

class Luhn
  def self.valid?(string_of_numbers)
    # Handle easy cases
    return false if string_of_numbers.length < 1
  end
end