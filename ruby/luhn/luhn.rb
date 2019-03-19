class Luhn
  def initialize(string_of_numbers)
    @string_of_numbers = string_of_numbers
  end

  def self.valid?(string_of_numbers)
    luhn = Luhn.new(string_of_numbers)
    luhn.valid?
  end

  def long_enough?
    @string_of_numbers.scan(/\d/).length > 1
  end

  def only_numbers?
    @string_of_numbers.match?(/^[\d\s]+$/)
  end

  def double_with_overflow(two_digits)
    p two_digits
    doubled_digit = (two_digits[1] || 0) * 2
    doubled_digit = doubled_digit > 9 ? doubled_digit - 9: doubled_digit
    puts "Returning #{doubled_digit} + #{two_digits[0]}"
    doubled_digit + two_digits[0]
  end

  def reversed_digits_only
    @string_of_numbers.reverse.scan(/\d/).map(&:to_i).map
  end

  def valid?
    return false unless ( long_enough? && only_numbers? )
    reversed_digits_only.each_slice(2).map{ |up_to_two_digits| double_with_overflow(up_to_two_digits)}.sum % 10 == 0
  end
end