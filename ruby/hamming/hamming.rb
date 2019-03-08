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
    return 0
  end
end