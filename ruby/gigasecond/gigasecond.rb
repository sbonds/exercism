=begin
From checking gigasecond_test.rb we'll need a class "Gigasecond" with a "from"
method that returns a Time object representing one gigasecond from the Time object
passed in.

https://ruby-doc.org/core-2.5.3/Time.html

=end

class Gigasecond
  def self.from(start_time) 
    # https://ruby-doc.org/core-2.5.3/Time.html#method-i-2B
    # The + operator adds the given number of seconds to an existing
    # Time object. Sounds very handy!
    start_time + 10**9
  end
end