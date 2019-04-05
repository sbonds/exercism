# Check whether a string of numbers follows the Luhn self-validation checksum.
class Luhn
  attr_reader :string_of_numbers

  def self.valid?(string_of_numbers)
    Luhn.new(string_of_numbers).valid?
  end

  def initialize(string_of_numbers)
    @string_of_numbers = string_of_numbers.delete(" ")
  end

  def valid?
    valid_format? && valid_luhn_sum?
  end

  private

  def valid_luhn_sum?
    luhn_sum % 10 == 0
  end

  def valid_format?
    string_of_numbers.match?(/^\d+$/) && string_of_numbers.length > 1
  end

  def luhn_sum
    string_of_numbers.reverse.chars.map(&:to_i).each_slice(2).sum do |first_digit, second_digit|
      double_with_overflow(second_digit) + first_digit
    end
  end

  def double_with_overflow(digit)
    doubled_digit = (digit || 0) * 2
    doubled_digit < 10 ? doubled_digit : doubled_digit - 9
  end
end
