/*
Package twofer implements a function "ShareWith" that takes a name (string) as an
argument. It should return the string:

	One for <name>, one for me.

If the string is empty it should print:

	One for you, one for me.

*/
package twofer

import "fmt"

/*
ShareWith returns an appropriate response to the name passed in to it.

*/
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
