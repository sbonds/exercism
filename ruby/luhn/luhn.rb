class Luhn
  attr_reader :string_of_numbers
  
  def self.valid?(string_of_numbers)
    Luhn.new(string_of_numbers).valid?
  end

  # https://github.com/rubocop-hq/ruby-style-guide#consistent-classes
  def initialize(string_of_numbers)
    # TODO: extract only digits during initialization
    @string_of_numbers = string_of_numbers
  end

  def valid?
    valid_format? && valid_luhn_sum?
  end

  private 

  def double_with_overflow(two_digits)
    doubled_digit = (two_digits[1] || 0) * 2
    (doubled_digit > 9 ? doubled_digit - 9: doubled_digit) + two_digits[0]
  end

  def valid_format?
    string_of_numbers.match?(/^[\d\s]+$/) && string_of_numbers.scan(/\d/).length > 1
  end

  def valid_luhn_sum?
    string_of_numbers.reverse.scan(/\d/).map(&:to_i).each_slice(2).sum{ |up_to_two_digits| double_with_overflow(up_to_two_digits)} % 10 == 0
  end

end