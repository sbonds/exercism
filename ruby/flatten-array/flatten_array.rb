=begin
Take an array, which could contain other arrays within it, and return a single array.

That array will have all non-nil values omitted and return everything else
(in the original order) as a single array without any nested arrays.

I'm assuming 'nil' was meant and not "null" since "null" isn't a Ruby concept.

https://stackoverflow.com/questions/10371673/how-i-can-check-if-an-object-is-null-in-ruby-on-rails-2

Handling a nested structure could be a good use of recursion, but that might be a
bit confusing. E.g. when the flatten process encounters another array as an element,
flatten that array before continuing to the next element.

=end
class FlattenArray
  def self.flatten(array_to_flatten)
    # By looking at other Exercism solutions I discovered the wonderful
    # array operator "compact" which removes all nil elements. NICE.
    # Add that to the final return and skip any element-by-element nil check
    #
    # https://stackoverflow.com/questions/1527888/ruby-test-for-array
    # zgchurch answer seems nicely Ruby-ish.
    # If the element has an each method, I can flatten it! :-)
    # If it doesn't have an each method, the element goes onto the end
    # of the array as-is
    #
    # The mentor ajoshguy let me know that "flatten" even exists in Ruby itself.
    # Though he considers it "cheating", in my opinion one of the great things
    # about Ruby is that it can do so much in so few lines of code. The hard
    # part is learning all those possible options.
    # So, the most Ruby-ish possible answer I could find...
    array_to_flatten.flatten.compact
  end
end