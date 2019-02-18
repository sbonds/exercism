=begin
Implement a HighScores class with these methods:

scores: returns an array of high scores that was passed in when the object was created

latest: returns the last member of the high scores array

personal_best: returns the largest score in the array

personal_top_three: returns an array of up to three elements containing the highest scores

=end

class HighScores
  def initialize(scores)
    @scores=scores
  end

  def scores
    @scores
  end

  def personal_best
    # http://ruby-doc.org/core-2.5.3/Enumerable.html#method-i-max
    # There's even a method for giving the max 'n' values. NICE!
    @scores.max
  end

  def personal_top_three
    @scores.max(3)
  end

  def latest
    # https://ruby-doc.org/core-2.5.3/Array.html#method-i-last
    # Ruby has everything! (If you know where to find it.)
    @scores.last
  end
end
