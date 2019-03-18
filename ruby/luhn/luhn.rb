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

  def double_with_overflow(number)
    doubled = number * 2
    doubled > 9 ? doubled - 9: doubled
  end

  def reversed_digits_only
    @string_of_numbers.reverse.scan(/\d/).map(&:to_i).map
  end

  def valid?
    return false unless ( long_enough? && only_numbers? )
    reversed_digits_only.with_index{ |number, index| index % 2 == 1 ? double_with_overflow(number) : number}.sum % 10 == 0
  end
end