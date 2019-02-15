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
    # Start with a not very Ruby-ish but easy to follow code.
    flat_array = []
    # Iterate over the array we received
    array_to_flatten.each do |element|
      # Skip nil values explicitly
      next if element == nil
      # https://stackoverflow.com/questions/1527888/ruby-test-for-array
      # zgchurch answer
      if element.respond_to?('each')
        # If the element has an each method, I can flatten it! :-)
        flat_array += self.flatten(element)
        next
      end
      # If it doesn't have an each method, the element goes onto the end
      # of the array as-is
      flat_array << element
    end
    return flat_array
  end
end