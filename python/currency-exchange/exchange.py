"""Exercism python currency-exchange"""
def estimate_value(budget, exchange_rate):
    """

    :param budget: float - amount of money you are planning to exchange.
    :param exchange_rate: float - unit value of the foreign currency.
    :return: float - estimated value of the foreign currency you can receive

    This function should return the estimated value of the foreign currency
    you can receive based on your budget and the current exchange rate.

    Note: If your currency is USD and you want to exchange USD for EUR with an
    exchange rate of 1.20, then 1.20 USD == 1 EUR.
    """

    return budget / exchange_rate


def get_change(budget, exchanging_value):
    """

    :param budget: float - amount of money you own.
    :param exchanging_value: int - amount of your money you want to exchange now.
    :return: float - amount left of your starting currency after exchanging

    This function should return the amount left of your starting currency after
    exchanging exchanging_value.
    """

    return budget - exchanging_value


def get_value(denomination, number_of_bills):
    """

    :param denomination: int - the value of a bill.
    :param number_of_bills: int - amount of bills you received.
    :return: int - total value of bills you now have

    This function should return the total value of bills you now have.
    """

    return number_of_bills * denomination


def get_number_of_bills(budget, denomination):
    """

    :param budget: float - the amount of money you are planning to exchange.
    :param denomination: int - the value of a single bill.
    :return: int - number of bills after exchanging all your money

    This function should return the number of bills after exchanging all your money.
    """

    return int(budget / denomination)


def exchangeable_value(budget, exchange_rate, spread, denomination):
    """

    :param budget: float - the amount of your money you are planning to exchange.
    :param exchange_rate: float - the unit value of the foreign currency.
    :param spread: int - percentage that is taken as an exchange fee.
    :param denomination: int - the value of a single bill.
    :return: int - maximum value you can get

    This function should return the maximum value you can get considering the budget,
    exchange_rate, spread, & denomination.

    Note: If 1 EUR == 1.20 USD and the spread is 10%, the actual exchange rate
    becomes 1 EUR == 1.32 USD.
    """

    actual_exchange_rate_with_spread = exchange_rate * (1 + spread / 100)
    target_currency_value = estimate_value(budget,actual_exchange_rate_with_spread)
    bills_received = get_number_of_bills(target_currency_value,denomination)
    return bills_received * denomination


def unexchangeable_value(budget, exchange_rate, spread, denomination):
    """

    :param budget: float - the amount of your money you are planning to exchange.
    :param exchange_rate: float - the unit value of the foreign currency.
    :param spread: int - percentage that is taken as an exchange fee.
    :param denomination: int - the value of a single bill.
    :return: int - unexchangeable value

    This function should return the unexchangeable value considering
    the budget, exchange_rate, spread, & denomination.
    """

    actual_exchange_rate_with_spread = exchange_rate * (1 + spread / 100)
    other_currency_received = exchangeable_value(budget, exchange_rate, spread, denomination)
    amount_paid_for_other_currency = other_currency_received * actual_exchange_rate_with_spread
    amount_left_in_budget = get_change(budget,amount_paid_for_other_currency)
    amount_left_in_budget_in_other_currency = \
        estimate_value(amount_left_in_budget,actual_exchange_rate_with_spread)

    # Returning this as an int seems arbitrary but it's what the test suite wants.
    return int(amount_left_in_budget_in_other_currency)
