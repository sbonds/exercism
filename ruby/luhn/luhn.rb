# Check whether a string of numbers follows the Luhn self-validation checksum.
class Luhn
  attr_reader :string_of_numbers
  
  def self.valid?(string_of_numbers)
    Luhn.new(string_of_numbers).valid?
  end

  # https://github.com/rubocop-hq/ruby-style-guide#consistent-classes
  def initialize(string_of_numbers)
    @string_of_numbers = string_of_numbers.delete(" ")
  end

  def valid?
    valid_format? && valid_luhn_sum?
  end

  private 

  def valid_format?
    string_of_numbers.match?(/^\d+$/) && string_of_numbers.length > 1
  end

  def luhn_sum
    string_of_numbers.reverse.chars.map(&:to_i).each_slice(2).sum(&:double_with_overflow)
  end

  def valid_luhn_sum?
     luhn_sum % 10 == 0
  end
end

# Add the 'utility function' to the class of its argument to allow the &:<name> idiom to work
class Array
  def double_with_overflow
    doubled_digit = (self[1] || 0) * 2
    (doubled_digit < 10 ? doubled_digit : doubled_digit - 9) + self[0]
  end
end