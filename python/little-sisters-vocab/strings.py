"""Manipulate some words to add or remove prefix and suffix or verbify them"""
SEPARATOR = ' :: '

def add_prefix_un(word):
    """

    :param word: str of a root word
    :return:  str of root word with un prefix

    This function takes `word` as a parameter and
    returns a new word with an 'un' prefix.
    """

    return 'un' + word


def make_word_groups(vocab_words):
    """

    :param vocab_words: list of vocabulary words with a prefix.
    :return: str of prefix followed by vocabulary words with
             prefix applied, separated by ' :: '.

    This function takes a `vocab_words` list and returns a string
    with the prefix  and the words with prefix applied, separated
     by ' :: '.
    """

    prefix=vocab_words[0]
    words=vocab_words[1::]
    prefixed_string = prefix
    for word in words:
        prefixed_string += SEPARATOR + prefix + word
    return prefixed_string

def remove_suffix_ness(word):
    """

    :param word: str of word to remove suffix from.
    :return: str of word with suffix removed & spelling adjusted.

    This function takes in a word and returns the base word with `ness` removed.
    """

    original_word = word[:-4:]
    if original_word[-1] == 'i':
        original_word = original_word[0:-1:] + 'y'
    return original_word


def noun_to_verb(sentence, index):
    """

    :param sentence: str that uses the word in sentence
    :param index:  index of the word to remove and transform
    :return:  str word that changes the extracted adjective to a verb.

    A function takes a `sentence` using the
    vocabulary word, and the `index` of the word once that sentence
    is split apart.  The function should return the extracted
    adjective as a verb.
    """

    # Drop the final character (.)
    # split on whitespace to get a list of words
    # return the index-th instance of a word
    word_to_verb=sentence[0:-1:].split()[index]
    return word_to_verb + "en"
