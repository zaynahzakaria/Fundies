use context starter2024

data Temperature:
  | celsius(degrees)
  | fahrenheit(degrees)
  | kelvin(degrees)
end

fun to-celcius(t :: Temperature) -> Number:
  cases (Temperature) t:
    | celsius(d) => d
    | fahrenheit(d) => (5/9) * (d - 32)
    | kelvin(d) => d - 273.15
  end
where:
  to-celcius(fahrenheit(80.6)) is 27
  to-celcius(kelvin(300)) is 26.85
  to-celcius(celsius(20)) is 20
end

data Task-Planner:
    Status(to-do :: String, in-progress :: String, done :: Number)
end


