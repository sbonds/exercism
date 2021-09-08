"""Exercism python card-games"""
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

    The function will return True if the round is in the list of
    rounds played, False if not:
    """

    return number in rounds


def card_average(hand):
    """

    :param hand: list - cards in hand.
    :return:  float - average value of the cards in the hand.

    Implement a function card_average(<hand>) that will return
    the average value of a hand of Black Joe.
    """

    return sum(hand) / len(hand)


def approx_average_is_average(hand):
    """

    :param hand: list - cards in hand.
    :return: bool - is approximate average the same as true average?

    Take the average of the first and last card values in the hand
    and compare to the real average. Return true if they equal.
    """

    approx_average = (hand[0] + hand[-1])/2
    return approx_average == card_average(hand)


def average_even_is_average_odd(hand):
    """

    :param hand: list - cards in hand.
    :return: bool - are even and odd averages equal?

    Implement a function average_even_is_average_odd(<hand>) that
    returns a Boolean indicating if the average of the cards at
    even indexes is the same as the average of the cards at odd indexes.
    """

    evens = hand[0::2]
    odds = hand[1::2]
    evens_ave = card_average(evens)
    odds_ave = card_average(odds)
    return evens_ave == odds_ave


def maybe_double_last(hand):
    """

    :param hand: list - cards in hand.
    :return: list - hand with Jacks (if present) value doubled.

    Implement a function maybe_double_last(<hand>) that takes a hand
    and checks if the last card is a Jack (11). If the the last card
    is a Jack (11), double its value before returning the hand
    """

    # The tests seem to expect us to change the original array in-place
    if hand[-1] == 11:
        hand[-1] = 22
    return hand
