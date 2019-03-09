=begin
Determine how many nucleotides differ in the sequences (strings of A/G/C/T) provided.
=end

=begin
Early issue-- the tests never call new() to create an instance of the Hamming object. So
a simple 'def compute' results in:

  HammingTest#test_single_letter_identical_strands:
  NoMethodError: undefined method `compute' for Hamming:Class
      hamming_test.rb:13:in `test_single_letter_identical_strands'

I found a nice, concise demo at:

https://dev.to/adamlombard/ruby-class-methods-vs-instance-methods-4aje

I think I found it once before... it looks familiar. :-)

Maybe writing a nice long, epic comment about it will help me remember it better next time.

We'll see!
=end

class Hamming
  # compute needs to be a class method since the tests never create a Hamming object via new()
  def self.compute(first_strand, second_strand)
    # This only works on identical string lengths, so check that early
    if first_strand.length != second_strand.length 
      raise ArgumentError.new('Strand lengths are not equal')
    end
    # The simple traditional programming solution would be to walk the strands and compare
    # character by character. That doesn't sound very Ruby-ish so first, review String
    # and Enumerable to see if anything stands out that might be useful for this.
    #  String.each_char might work-- but how to get the index for checking the other string?
    #  Enumerable.each_slice(1) might work, same problem though
    #  Enumerable.each_with_index{ |item, index| ... } looks VERY promising!
    #
    # Let's try some IRB!
    #  >> first_strand="GATTACA";second_strand="GATTACG";first_strand.each_with_index{ |nucleotide, position| p nucleotide }
    #  Traceback (most recent call last):
    #    2: from C:/Ruby25-x64/bin/irb.cmd:19:in `<main>'
    #    1: from (irb):9
    #  NoMethodError (undefined method `each_with_index' for "GATTACA":String)
    #  Did you mean?  each_line
    # /facepalm... oh, yeah... enumerable method, not string method! So that each_char is going to be useful
    # after all!
    #   >> first_strand="GATTACA";second_strand="GATTACG";first_strand.each_char.each_with_index{ 
    #      |nucleotide, position| printf("%s:%s\n", position, nucleotide) }
    #   0:G
    #   1:A
    #   2:T
    #   3:T
    #   4:A
    #   5:C
    #   6:A
    #   => "GATTACA"
    # Hey, that's pretty close for so early in the IRB process! Add a comparison and some summing up to count 
    # the differences.
    distance = 0
    first_strand.each_char.each_with_index{ |nucleotide, position| distance += 1 unless ( nucleotide == second_strand[position] ) }
    return distance
  end
end