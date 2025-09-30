use context dcic2024
include csv
include data-source 

# Problem 1
fun leap-year-calculation(year :: Number) -> Boolean:
  doc: "returns true when the year is divisible by 4 and is therefore a leap year, and false when it is not."
  if num-modulo(year, 4) == 0: true
  else: 
    false
end
where:
  leap-year-calculation(2024) is true
  leap-year-calculation(2025) is false
end
# this function evaluates whether or not a given year is a leap year

# Problem 2
fun tick(n :: Number):
  doc: "returns the following second when a valid integer between 0 and 59 is inputted, acting like a ticking clock."
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
# this function acts as a ticking clock and returns the next second when inputted a number between 0 and 59 inclusive

# Problem 3
"Each player must choose either rock, paper, or scissors. Note that you must put each choice in quotation marks. Keep in mind that the first choice is player 1 and the second is player 2."
fun rock-paper-scissors(p1 :: String, p2 :: String) -> String:
  doc: "takes two choices (player 1 and player 2). Each choice must be rock, paper, or scissors. returns 'tie' if both choices are the same, 'player 1' if player 1 wins, 'player 2' if player 2 wins, or 'invalid choice' for an invalid input."
  if p1 == p2:
    "tie"
  else if (p1 == "rock") and (p2 == "paper"):
    "player 2"
  else if (p1 == "paper") and (p2 == "rock"):
    "player 1"
  else if (p1 == "rock") and (p2 == "scissors"):
    "player 1"
  else if (p1 == "scissors") and (p2 == "rock"):
    "player 2"
  else if (p1 == "paper") and (p2 == "scissors"):
    "player 2"
  else if (p1 == "scissors") and (p2 == "paper"):
    "player 1"
  else: "invalid choice"
  end
where: 
  rock-paper-scissors("rock", "rock") is "tie"
  rock-paper-scissors("paper", "scissors") is "player 2"
  rock-paper-scissors("pencil", "paper") is "invalid choice"
end 
# this function is a rock-paper-scissors game which allows to players to make their choice and the funtion returns the winner 

# Problem 4
planets = table: 
  planet :: String, distance :: Number 
  row: "Mercury", 0.39
  row: "Venus", 0.72
  row: "Earth", 1
  row: "Mars", 1.52
  row: "Jupiter", 5.2
  row: "Saturn", 9.54
  row: "Uranus", 19.2
  row: "Neptune", 30.06
end
mars = planets.row-n(3)["distance"]
# this function creates a table including 8 planets and their distances from the sun in astronomical units. it also extracts row 3 and assigns it to the variable mars and then outputs the distance from the variable

# Problem 5
something = load-table:
  year, day, month, rate
  source: csv-table-file("boe_rates.csv", default-options)
  sanitize year using num-sanitizer
  sanitize day using num-sanitizer
  sanitize rate using num-sanitizer
  end
count-rows = something.length()
median-rate = median(something, "rate")
mode-rate = modes(something, "rate")
ordered-ascending = order something:
  rate ascending
end
ordered-descending = order something:
  rate descending
end
# loads table into pyret and is assigned to a variable named something. columns with numeric data are converted into numbers using the sanitizer, the median and mode of the rate column is returned, and the rate column is ordered in both ascending and descending order