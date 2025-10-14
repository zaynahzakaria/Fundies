use context starter2024

include csv
include data-source
import lists as L
import math as M

url = "https://pdi.run/f25-dcic-events-cleaned.csv"
cleaned-data =
  load-table: name, email, tickcount, discount, delivery, zip
    source: csv-table-url(url, default-options)
    sanitize name using string-sanitizer
    sanitize email using string-sanitizer
    sanitize tickcount using num-sanitizer
    sanitize discount using string-sanitizer
    sanitize delivery using string-sanitizer
    sanitize zip using string-sanitizer
  end

# List Operations 

codes = cleaned-data.get-column("discount")
duplicates-removed = L.distinct(codes)

uppercase = L.map(string-to-upper,
  (duplicates-removed))

# i have 2 unique codes after cleaning

survey-responses = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]

unique-responses = L.distinct(survey-responses)

lowercase = L.map(string-to-lower,
  (unique-responses))

definitive-answers = L.filter(lam(c): not(c == "maybe") end, lowercase)

# Loops

num-list = [list: 2, 15, 27, 9, 3]

fun product(num-list :: List<Number>) -> Number block:
  var p =  1
  for each(n from num-list):
    p := p * n
  end

  fun sum-even-numbers(num-list :: List<Number>) -> Number block:
    var sum = 0
    for each(n from num-list):
      if (num-modulo(n, 2) == 0):
        sum := n + sum
      else:
        sum := sum
      end 
    end

    M.sum(filter(lam(n):
  
my-length = length(num-list) 
  
my-doubles-map = map(lam(n): n * 2 end, num-list)