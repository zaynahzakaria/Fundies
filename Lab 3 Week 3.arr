use context dcic2024
# Problem 1
fun leap-year-calculation(year :: Number) -> Boolean:
  if num-modulo(year, 4) == 0: true
  else: 
    false
end
where:
  leap-year-calculation(2024) is true
  leap-year-calculation(2025) is false
end
# this function returns true when the year is divisible by 4 because it is a leap year, and false when it is not

# Problem 2
fun tick(n :: Number):
  doc: "returns the following second when a valid integer between 0 and 59 is inputted, acting like a ticking clock"
  if (num-is-integer(n)) and ((n <= 58) and (n >= 0)): 
    n + 1
    else if n == 59:
    "1 minute"
    else: "invalid number"
    end  
where:
  tick(59) is "1 minute"
  tick(27) is 28
  tick(100) is "invalid number"
end
