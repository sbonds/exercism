EXPECTED_BAKE_TIME=40
PREPARATION_TIME=2 # Per layer?

def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int baking time already elapsed.
    :return: int remaining bake time derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time

# TODO: define the 'preparation_time_in_minutes()' function
def preparation_time_in_minutes(layers_of_lasagne):
    """Calculate the prep time needed.

    :param layers_of_lasagne: int layers desired in this lasagne.
    :return: int remaining bake time derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the number of layers in the lasagna as
    an argument and returns how many minutes of prep time the lasagna needs
    based on the `PREPARATION_TIME` per layer.
    """

    return layers_of_lasagne * PREPARATION_TIME

# TODO: define the 'elapsed_time_in_minutes()' function
