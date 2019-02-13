# Read the instructions better:
#   Write a function that returns the string "Hello, World!".
=begin
Test output:
  1) Error:
HelloWorldTest#test_say_hi:
NameError: uninitialized constant HelloWorldTest::HelloWorld
Did you mean?  HelloWorldTest

Perhaps it's not just any function name, but a specific function name
expected. Like "HelloWorld"?

Maybe I should watch the video? It mentions the GETTING_STARTED.md file which
contains more details than the web page.
=end
class HelloWorld
  def self.hello
    "Hello, World!"
  end
end