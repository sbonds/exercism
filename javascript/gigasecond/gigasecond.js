//
// gigasecond.js
//
// Method gigasecond(date) calculates the date when 10^9 seconds have passed from the date provided

export function gigasecond(startDate) {
  // Javascript getTime is in ms, so use 1000 ms-per-s times the number of seconds to add
  return new Date(startDate.getTime() + 1000*10**9);
}