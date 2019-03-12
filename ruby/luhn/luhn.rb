class Luhn
  def self.valid?(string_of_numbers)
    return false if string_of_numbers.scan(/\d/).length < 2
    return false unless string_of_numbers.match?(/^[\d\s]+$/)
    string_of_numbers.reverse.scan(/\d/).map(&:to_i).map.with_index{ |number, index| index % 2 == 1 ? (number * 2 > 9 ? number*2 - 9: number*2) : number}.sum % 10 == 0
  end
end