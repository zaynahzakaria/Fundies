use context starter2024
# sample table to use for exercises 
times = table:
  time :: String, amount :: Number
  row: "08:30", 5
  row: "11:15", 10
  row: "13:00", 7
  row: "09:45", 12
  row: "15:20", 20
end

# returns true if the time is before 12:00 and false is it's 12:00 or after that, indicating whether or not it is morning at that time
fun is-morning(r :: Row) -> Boolean:
  (r["time"] < "12:00") 
where:
  is-morning(times.row-n(2)) is false
  is-morning(times.row-n(0)) is true
end


#2 Now produce a new table that is only morning orders using filter-with
#3 Recreate the is-morning function as an unnamed function you pass to filter-with
#4 Create a table where the orders are sorted by time from latest to earliest, rather than how the original table is sorted.
#5 Use order-by, rather than constructing it by hand.
#6 Write code to extract the amount of the latest morning order