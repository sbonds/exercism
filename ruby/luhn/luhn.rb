class Luhn
  attr_reader :string_of_numbers

  def initialize(string_of_numbers)
    @string_of_numbers = string_of_numbers
  end

  def self.valid?(string_of_numbers)
    luhn = Luhn.new(string_of_numbers)
    luhn.valid?
  end

  def long_enough?
    string_of_numbers.scan(/\d/).length > 1
  end

  def only_numbers?
    string_of_numbers.match?(/^[\d\s]+$/)
  end

  def double_with_overflow(two_digits)
    doubled_digit = (two_digits[1] || 0) * 2
    (doubled_digit > 9 ? doubled_digit - 9: doubled_digit) + two_digits[0]
  end

  def valid?
    return false unless ( long_enough? && only_numbers? )
    # It seems like there should be a way to use &: or & to shorten that map{ || } block, but I'm not finding how to do that.
    # Would I really need to extend Array to make that work?
    #  map(&:double_with_overflow) gives:
    #   NoMethodError: undefined method `double_with_overflow' for [9, 5]:Array
    string_of_numbers.reverse.scan(/\d/).map(&:to_i).map.each_slice(2).map{ |up_to_two_digits| double_with_overflow(up_to_two_digits)}.sum % 10 == 0
  end
end