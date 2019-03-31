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

  # This 'utility function' makes no use of class variables so it could be located anywhere.
  # For example, it could be moved to a new class. However, since it's a private method and
  # adding a new class would be more complex than leaving this short function in place,
  # this utility function seems the lesser of the two evils.
  def double_with_overflow(digit)
    doubled_digit = (digit || 0) * 2
    doubled_digit < 10 ? doubled_digit : doubled_digit - 9
  end

  def valid_format?
    string_of_numbers.match?(/^\d+$/) && string_of_numbers.length > 1
  end

  def luhn_sum
    # It seems like sum { |m| method(m) } should be able to be coerced into sum { &:method } somehow.
    # There seems to be some aspect of .to_proc which I'm missing that might enable this.
    string_of_numbers.reverse.chars.map(&:to_i).each_slice(2).sum{ |first_digit, second_digit| double_with_overflow(second_digit) + first_digit}
  end

  def valid_luhn_sum?
     luhn_sum % 10 == 0
  end
end