=begin
Check whether a year is a leap year by implementing a Year.leap? method. Do not use the Ruby built-ins.

Leap year logic:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400

This means a year is a leap year if:

  Year evenly divides by 4 AND (year is not evenly divisible by 100
  OR year is divisible by 400)

Use the modulo operator to determine if something is "evenly" divisible
(remainder / modulus is zero)
https://ruby-doc.org/core-2.5.3/Numeric.html#method-i-25

=end

class Year
  def self.leap?(year) # Why does this need to be 'def self.leap?'' instead of 'def leap?' ?
    # It's so easy when I rephrase it using boolean operators. :-)
    return ((year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0)))
  end
end
