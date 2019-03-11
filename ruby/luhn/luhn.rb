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
    return false if string_of_numbers.scan(/\d/).length < 2
    return false unless string_of_numbers.match?(/^[\d\s]+$/)
    # Play with IRB and each_with_index, checking index for modulus 2, summing up based on that result, and a final modulus 10.
    #   >> "4539 1488 0343 6467".scan(/\d/).each_with_index{ |number, index| index % 2 ? number * 2 : number}.sum % 10
    #   TypeError (String can't be coerced into Integer)
    # No coercion? I guess I'll try flat out extortion or blackmail, then! :-) [add a .to_i]
    #   >> "4539 1488 0343 6467".scan(/\d/).map(&:to_i).each_with_index{ |number, index| index % 2 ? number * 2 : number}.sum % 10
    #   => 5
    # Hmm... I was expecting zero... Go back to da beginning, Vizzini!
    #   >> "4539 1488 0343 6467".scan(/\d/)
    #   => ["4", "5", "3", "9", "1", "4", "8", "8", "0", "3", "4", "3", "6", "4", "6", "7"]
    # Looks like what I expected...
    #   >> "4539 1488 0343 6467".scan(/\d/).map(&:to_i)
    #   => [4, 5, 3, 9, 1, 4, 8, 8, 0, 3, 4, 3, 6, 4, 6, 7]
    # Still seems like what I thought would happen, which says a lot for what I've learned on Exercism...
    #   >> "4539 1488 0343 6467".scan(/\d/).map(&:to_i).each_with_index{ |number, index| index % 2 == 0 ? number * 2 : number}
    #   => [4, 5, 3, 9, 1, 4, 8, 8, 0, 3, 4, 3, 6, 4, 6, 7]
    # Good news! That does NOT match what I expected, so I know where it's going wrong.
    # Ah! If I want something BACK I either need to assign it within the "each" block or use my old buddy, map.
    #   >> "4539 1488 0343 6467".scan(/\d/).map(&:to_i).map.with_index{ |number, index| index % 2 == 0 ? number * 2 : number }
    #   => [8, 5, 6, 9, 2, 4, 16, 8, 0, 3, 8, 3, 12, 4, 12, 7]
    #   >> "4539 1488 0343 6467".scan(/\d/).map(&:to_i).map.with_index{ |number, index| number % 2 ? number * 2 : number}.sum % 10
    #   => 0
    # I bet I can eliminate one of those extra map() calls too. (At the cost of adding an extra .to_i)
    # (OK, that got unwieldy as I used number multiple times, so I put it back in.)
    # "059" is supposed to be valid?
    #   0 x 2 = 0
    #   5     = 5
    #   9 x 9 = 18 - 9 = 9
    # 5+9 = 14, which is NOT divisible by 10 so this should NOT be valid by my understanding of the problem description...
    # Oh... uh...
    #
    # "Starting from the right"
    #
    # /facepalm
    #
    # And every 2nd starting in the index = 1 position (so it's odds now.) Good thing I remember reading about 
    # String.reverse in the Ruby docs.
    string_of_numbers.reverse.scan(/\d/).map(&:to_i).map.with_index{ |number, index| index % 2 == 1 ? (number * 2 > 9 ? number*2 - 9: number*2) : number}.sum % 10 == 0
  end
end