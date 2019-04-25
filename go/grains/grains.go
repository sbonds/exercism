/*Package grains determines the number of grains of wheat on a given chess square if doubled each time.*/
package grains

import (
	"errors"
	"fmt"
	"math"
)

/*Based on the testing it looks like we need to implement a method called Square which returns the
number of grains of wheat on the given square. We also need a Total method which returns the total
number of grains for all 64 squares.*/

/*Square returns the total number of grains of wheat on a given square*/
func Square(squareNumber int) (uint64, error) {
	_, error := squareValid(squareNumber)
	if error != nil {
		return 0, error
	}
	grains := uint64(math.Pow(2, float64(squareNumber-1)))
	fmt.Printf("On square %v there are %v grains.\n", squareNumber, grains)
	return grains, nil
}

/*Total returns the total number of grains of wheat on all 64 squares.*/
func Total() uint64 {
	/* Since there's no input this would be a great candidate for a hardcoded value, however, I like to make my CPU cry... */
	total := uint64(0)
	for i := 1; i < 65; i++ {
		square, error := Square(i)
		fmt.Printf("Total so far: %v. On square %v there were %v grains.\n", total, i, square)
		if error == nil {
			total += square
		} else {
			return 0
		}
	}
	return total
}

func squareValid(squareNumber int) (bool, error) {
	if squareNumber > 0 && squareNumber < 65 {
		return true, nil
	}
	return false, errors.New("not a valid square. Must be between 1 and 64, inclusive")
}
