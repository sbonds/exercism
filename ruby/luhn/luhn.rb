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

  def early_checks_fine?
    long_enough? && only_numbers?
  end

  def handle_over_nine(number)
    number * 2 > 9 ? number*2 - 9: number*2
  end

  def valid?
    return false unless early_checks_fine?
    @string_of_numbers.reverse.scan(/\d/).map(&:to_i).map.with_index{ |number, index| index % 2 == 1 ? handle_over_nine(number) : number}.sum % 10 == 0
  end
end