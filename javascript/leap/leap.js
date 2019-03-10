//
// leap.js
// Calculate whether a given year is a leap year based on the logic of:
// on every year that is evenly divisible by 4
//  except every year that is evenly divisible by 100
//  unless the year is also evenly divisible by 400
// This means a year is a leap year if:
//
// Year evenly divides by 4 AND (year is not evenly divisible by 100 OR year is divisible by 400)

export function isLeap(year) {
  return (( year % 4 == 0) && (( year % 100 != 0 ) || ( year % 400 == 0 )))
}