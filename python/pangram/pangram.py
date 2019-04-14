# A sentence is a pangram if it uses every letter A-Z (case insensitive) at least once
#
# Thoughts on how to do this:
# + create a data structure with keys a-z and track each one with a boolean
# + filter out [A-Za-z], make a unique sort, and ensure there are 26 letters found
# + search for each letter in turn and fail if one is not found
# Going with the third option...
#
# Seen in community solutions:
# (https://exercism.io/tracks/python/exercises/pangram/solutions/439c96dce1964a41b96f44e2fa3bd4d7)
#   return all(map(lambda c: c in sentence.lower(), string.ascii_lowercase))
# I think we found the Ruby programmer! :-)
import string

def is_pangram(sentence):
    lowercase_sentence = sentence.lower()
    for letter in string.ascii_lowercase:
        if letter not in lowercase_sentence:
            return False
    return True