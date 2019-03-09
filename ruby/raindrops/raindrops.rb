=begin
Given a number, return a string based on whether 3, 5, or 7 are factors.

=end

class Raindrops
  # I can see no use of new() in the tests so I know I'll need a class method. I'm learning! (*looks amazed*)
  def self.convert(number)
    # Any time I have to take a group of things and use them to operate on another thing, I start thinking "map"
    # I wonder if that will work here too? Time to go explore Mount IRB! :-)
    #
    #  >> number=30;[3, 5, 7].map{|divisor| number % divisor == 0}
    #  => [true, true, false]
    # That seems promising, now I just need a place to look up the right string to include
    # for each "yes, it divides equally" case.
    #
    # Somehow I got IRB very confused where it wasn't even defining a simple hash:
    #  >> phrase = { 3 => "Pling", 5 => "Plang", 7 => "Plong" }
    #  >> phrase
    # (no output)
    #  >> grades = { "Jane Doe" => 10, "Jim Doe" => 6 }
    #  >> p grades
    # Turning IRB off and back on again restored some sanity
    #  >irb
    #  >> grades = { "Jane Doe" => 10, "Jim Doe" => 6 }
    #  => {"Jane Doe"=>10, "Jim Doe"=>6}
    #  >> p grades
    #  {"Jane Doe"=>10, "Jim Doe"=>6}
    #  => {"Jane Doe"=>10, "Jim Doe"=>6}
    #
    # Try my lookup again...
    #  >> phrase = { 3 => "Pling", 5 => "Plang", 7 => "Plong" }
    #  => {3=>"Pling", 5=>"Plang", 7=>"Plong"}
    #  >> response="";number=30;[3, 5, 7].map{|divisor| if number % divisor == 0 { response += phrase[divisor] } }
    #  >> p phrase
    #  >>
    # I'm breaking IRB? *very confused*
    # Try something else-- maybe the ternary operator? That would also possibly help catch the case of "no divisors work"
    #  >> phrase = { 3 => "Pling", 5 => "Plang", 7 => "Plong" }
    #  => {3=>"Pling", 5=>"Plang", 7=>"Plong"}
    #  >> response="";number=30;[3, 5, 7].map{|divisor| number % divisor == 0 ? response += phrase[divisor] : number}
    #  => ["Pling", "PlingPlang", 30]
    # Well, that worked even better than expected! I figured that I'd end up with something like "303030" for each check
    # that failed on the original number.
    #
    # So, for the final version I can either hardcode the hash keys in the check or pull them straight from the hash
    # itself. The latter is more flexible for future changes, and the former is (probably) faster. However, in the spirit
    # of flexibility vs. premature optimization I'll go for the "more flexible" approach and optimize for speed "later"
    # if needed. Also toss in a sort in case someone later adds a key that has a lower number as a divisor.
    #
    # phrase.keys.sort.map{|divisor| number % divisor == 0 ? response += phrase[divisor] : number}
    #
    #   1) Failure:
    #   RaindropsTest#test_the_sound_for_1_is_1 [raindrops_test.rb:8]:
    #   Expected: "1"
    #   Actual: [1, 1, 1]
    # Ah, there's the repetition I was worried about. It makes sense-- I shouldn't have had "30" in my response
    # above at all. Test driven development works nicely, doesn't it?
    # 
    # Perhaps "map" wasn't the right choice after all? Also, perhaps the ternary is overkill and I should use a simplified
    # "if" using "&&"?
    #
    #  >> response="";number=30;phrase.keys.sort.each{|divisor| number % divisor == 0 && response += phrase[divisor]}
    #  => [3, 5, 7]
    #  >> p response
    #  "PlingPlang"
    #  => "PlingPlang"
    #
    # Perhaps the each_with_object method I learned back in "word count" would help here? I could create a string
    # and then append to it each time, returning the string when done (for a later check on emptiness to see if I
    # need to return the number instead.)
    #
    # It appears that the each_with_object when used with a string creates a new instance of the string on each iteration
    # so appending to it does nothing... *sadness*
    #   >> number=30;phrase.keys.sort.each_with_object(""){|divisor,response| p response; number % divisor == 0 && response += phrase[divisor]; p response}
    #   ""
    #   "Pling"
    #   ""
    #   "Plang"
    #   ""
    #   ""
    #   => ""
    #
    # I think I'll need some mentor help to find the Ruby Way to do this. For now go with the following slightly suboptimal
    # solution:
    # 1) Build the appropriate string using a pre-defined string, appending to it as appropriate
    # 2) Test the string for emptiness afterwards and return the original number if empty
    response = ""
    phrase = { 3 => "Pling", 5 => "Plang", 7 => "Plong" }
    phrase.keys.sort.each{|divisor| number % divisor == 0 && response += phrase[divisor]}
    response.empty? ? number.to_s : response
  end
end