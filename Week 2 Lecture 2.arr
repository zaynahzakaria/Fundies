use context starter2024
# area calculation
fun area-calculation(width :: Number, height :: Number) -> Number:
  doc: "returns area using width and height"
  width * height
end

# t-shirts 
cost-per-tshirt = 5
cost-per-character = 0.1

fun tshirt-cost(num :: Number, message :: String):
  doc: "returns the cost of t-shirts with messages printed on them by counting number of characters in the message, multiplying it by the price per character, and adding the fixed cost per t-shirt"
  num * (cost-per-tshirt + (cost-per-character * (string-length(message))))
end

tshirt-cost(4, "Go team!")
tshirt-cost(7, "Hello World")

# converting celsius and fahrenheit
fun celsius-to-fahrenheit(celsius :: Number):
  doc: "converts degrees in celsius to return temperature in fahrenheit"
  (celsius * 9/5) + 32
end
  
# converting fahrenheit and celsius
fun fahrenheit-to-celsius(fahrenheit :: Number):
  doc: "converts degrees in fahrenheit to return temperature in celsius"
  (fahrenheit - 32) * 5/9
end

# checking degree conversions
check:
  celsius-to-fahrenheit(0) is 32
  fahrenheit-to-celsius(32) is 0
  celsius-to-fahrenheit(18) is 64.4
end