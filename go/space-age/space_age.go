/*Package space implements a function to calculate a duration in planet-specific years
based on the number of Earth seconds.
*/
package space

/* Planet appears to be an enumerated type based on reading cases_test.rb:

	var testCases = []struct {
		description string
		planet      Planet
		seconds     float64
		expected    float64
	}

It's not defined anywhere else, so it looks like it was expected that I define it.

That's a heck of a leap from "Hello, World!"

https://en.wikipedia.org/wiki/Enumerated_type#Go
*/
type Planet string

const (
	Earth = iota
	Mercury
	Venus
	Mars
	Jupiter
	Saturn
	Uranus
	Neptune
)

/*
variable secondsPerYear: records the number of Earth seconds is the length of
each planet's year.

https://golang.org/doc/effective_go.html#maps

From the exercise info:
	Given an age in seconds, calculate how old someone would be on:

	Earth: orbital period 365.25 Earth days, or 31557600 seconds
	Mercury: orbital period 0.2408467 Earth years
	Venus: orbital period 0.61519726 Earth years
	Mars: orbital period 1.8808158 Earth years
	Jupiter: orbital period 11.862615 Earth years
	Saturn: orbital period 29.447498 Earth years
	Uranus: orbital period 84.016846 Earth years
	Neptune: orbital period 164.79132 Earth years

*/
var secondsPerYear = map[int]float64{
	Earth:   31557600,
	Mercury: 0.2408467 * 31557600,
	Venus:   0.61519726 * 31557600,
	Mars:    1.8808158 * 31557600,
	Jupiter: 11.862615 * 31557600,
	Saturn:  29.447498 * 31557600,
	Uranus:  84.016846 * 31557600,
	Neptune: 164.79132 * 31557600,
}

/*Age calculates a duration in planet-specific years based on the number
of Earth seconds provided. Called as:

Age(Earth seconds (integer), Planet name(string))

go-lint requires that there be no whitespace after the comment start. It hurts!
https://github.com/golang/lint/issues/152

https://golang.org/ref/spec#Predeclared_identifiers

integer is not a type, use "uint64" since we might have a lot of seconds.

Also, if we're going to return an error, it needs to be in the declaration.
(https://stackoverflow.com/questions/25455233/how-to-solve-too-many-arguments-to-return-issue-in-golang)

https://gobyexample.com/errors
"By convention, errors are the last return value and have type error, a built-in interface."

The tests give:

	.\cases_test.go:9:14: undefined: Planet
	.\space_age_test.go:11:16: multiple-value Age() in single-value context
	FAIL    _/C_/Users/sbonds/Exercism/go/space-age [build failed]

So it looks like the test requires that Age not return an error.

https://golang.org/pkg/math/#NaN

	looks like float64 is required-- convert all the floats to float64 to match
	this test case requirement.

New test failure:

.\cases_test.go:9:14: undefined: Planet
FAIL    _/C_/Users/sbonds/Exercism/go/space-age [build failed]

So we need to create a new variable type called "Planet"... how to do that?

This was sort of helpful:

https://stackoverflow.com/questions/14426366/what-is-an-idiomatic-way-of-representing-enums-in-go?noredirect=1&lq=1

*/
func Age(earthSeconds float64, planet Planet) float64 {
	/*
		Check if we have info on the number of seconds for the given planet

		From https://golang.org/doc/effective_go.html#maps:

			Sometimes you need to distinguish a missing entry from a zero value. Is there an entry for "UTC" or is that 0 because it's not in the map at all? You can discriminate with a form of multiple assignment.

				var seconds int
				var ok bool
				seconds, ok = timeZone[tz]

			For obvious reasons this is called the "comma ok" idiom. In this example, if tz is present, seconds will be set appropriately and ok will be true; if not, seconds will be set to zero and ok will be false. Here's a function that puts it together with a nice error report:

				func offset(tz string) int {
					if seconds, ok := timeZone[tz]; ok {
							return seconds
					}
					log.Println("unknown time zone:", tz)
					return 0
				}

		What is the :=?

			https://golang.org/ref/spec#Short_variable_declarations

		It looks like this assigns a new value to a variable but cannot specify
		the variable type. Presumably this is why a full-with-type declaration
		is needed first.

		This is still a bit puzzling, so it's something to watch and learn as
		I continue working with Go.

		Now I get the error "years declared and not used" when it seems like it's used:
			var years float32                            // define a type for 'years'
			var ok bool                                  // used as a flag, so its type is boolean
			if years, ok := secondsPerYear[planet]; ok { // "comma ok" idiom
				return float32(earthSeconds) / years, nil
			}

		So the declaration is not only not needed, it's not allowed. How does Go know
		the type of these variables then? Assuming a type doesn't seem very Go-like.
	*/
	if years, ok := secondsPerYear[planet]; ok { // "comma ok" idiom
		return float64(earthSeconds) / years
	}

	/*
		https://gobyexample.com/errors
	*/
	// Can't return an error due to the requirements of the test environment.
	// return -1, errors.New(fmt.Sprintf("Unknown planet: %s", planet))
	return -1
}
