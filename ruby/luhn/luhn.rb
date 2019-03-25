class Luhn
  attr_reader :string_of_numbers

  def initialize(string_of_numbers)
    @string_of_numbers = string_of_numbers
  end

  def self.valid?(string_of_numbers)
    luhn = Luhn.new(string_of_numbers)
    luhn.valid?
  end

  def double_with_overflow(two_digits)
    doubled_digit = (two_digits[1] || 0) * 2
    (doubled_digit > 9 ? doubled_digit - 9: doubled_digit) + two_digits[0]
  end

  def valid_format?
    string_of_numbers.match?(/^[\d\s]+$/) && string_of_numbers.scan(/\d/).length > 1
  end

  def valid_luhn_sum?
    string_of_numbers.reverse.scan(/\d/).map(&:to_i).map.each_slice(2).sum{ |up_to_two_digits| double_with_overflow(up_to_two_digits)} % 10 == 0
  end

  def valid?
    valid_format? && valid_luhn_sum?
  end
end