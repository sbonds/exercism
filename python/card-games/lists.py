def get_rounds(number):
    """

     :param number: int - current round number.
     :return: list - current round and the two that follow.

     Implement a function get_rounds(<round_number>) that
     takes the current round number and returns a single list
     with that round and the next two that are coming up:
    """

    return [number,number+1,number+2]


def concatenate_rounds(rounds_1, rounds_2):
    """

    :param rounds_1: list - first rounds played.
    :param rounds_2: list - second set of rounds played.
    :return: list - all rounds played.

    Implement a function concatenate_rounds(<rounds_1>, <rounds_2>)
    that takes two lists and returns a single list consisting of
    all the rounds in the first list, followed by all the rounds
    in the second list:
    """

    return rounds_1 + rounds_2


def list_contains_round(rounds, number):
    """

    :param rounds: list - rounds played.
    :param number: int - round number.
    :return:  bool - was the round played?
    """

    pass


def card_average(hand):
    """

    :param hand: list - cards in hand.
    :return:  float - average value of the cards in the hand.
    """

    pass


def approx_average_is_average(hand):
    """

    :param hand: list - cards in hand.
    :return: bool - is approximate average the same as true average?
    """

    pass


def average_even_is_average_odd(hand):
    """

    :param hand: list - cards in hand.
    :return: bool - are even and odd averages equal?
    """

    pass


def maybe_double_last(hand):
    """

    :param hand: list - cards in hand.
    :return: list - hand with Jacks (if present) value doubled.
    """

    pass
