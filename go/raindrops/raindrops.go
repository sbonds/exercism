/*Package raindrops implements a function to check if a number has 3, 5, or 7 as
a factor and return appropriate raindroplike text back.
*/
package raindrops

import (
	"strconv"
	"strings"
)

/*Convert takes the input int value and returns the following based on whether
it has 3, 5, and/or 7 as a factor:
	If the number has 3 as a factor, return 'Pling'.
	If the number has 5 as a factor, return 'Plang'.
	If the number has 7 as a factor, return 'Plong'.
	If the number has none of these as factors, return the number itself (as a string).
	If the number has more than one of these factors, return the text concatenated
	  in the above order.
*/
func Convert(number int) string {
	// http://herman.asia/efficient-string-concatenation-in-go
	// Using Method 2 as a good tradeoff between speed and readability/simplicity
	sound := []string{}
	if number%3 == 0 {
		sound = append(sound, "Pling")
	}
	if number%5 == 0 {
		sound = append(sound, "Plang")
	}
	if number%7 == 0 {
		sound = append(sound, "Plong")
	}
	if len(sound) == 0 {
		return strconv.Itoa(number)
	}
	return strings.Join(sound, "")
}
