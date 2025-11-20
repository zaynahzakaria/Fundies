use context dcic2024
include csv
include data-source
import tables as T

penguins-table = load-table:  num, species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, year
  source: csv-table-file("penguins 3.csv", default-options)
  sanitize num using num-sanitizer
  sanitize bill_length_mm using num-sanitizer
  sanitize bill_depth_mm using num-sanitizer
  sanitize flipper_length_mm using num-sanitizer
  sanitize body_mass_g using num-sanitizer
  sanitize year using num-sanitizer
end

penguins-table

# Scalar Processing

# extracts the body_mass_g column from the penguins table and produces a list of body mass values in grams
body-mass = extract body_mass_g from penguins-table 
end
  
fun body-mass-kg(m :: Number) -> Number:
  doc:  "takes one body mass value (in grams) and converts it into kilograms by dividing by 1000"
  m / 1000
end

# testing the body-mass-kg function with examples
check:
  map(body-mass-kg, [list: 2700, 4600, 6000])
    is [list: 2.7, 4.6, 6]
end

body-mass-kg 

# Transformation 

fun add-weight(r :: Row) -> String:
  doc: "takes a row from the penguins table and returns a label (light, medium, or heavy) based on the penguin's body mass in grams"
  if r["body_mass_g"] < 4000:
    "light"
  else if r["body_mass_g"] < 5000:
    "medium"
  else:
    "heavy"
  end
end

# testing the add-weight function with three known rows
check:
  add-weight(penguins-table.row-n(1)) is "light"
  add-weight(penguins-table.row-n(6)) is "medium"
  add-weight(penguins-table.row-n(169)) is "heavy"
end  

# creates a new table by adding a "weight" column that categorises each penguin as light, medium, or heavy using the add-weight function
weight-categorised = build-column(penguins-table, "weight", add-weight)

weight-categorised

# Selection 

fun gentoo-and-after-2007(r :: Row) -> Boolean:
  doc: "takes a row from the penguins table and returns true only if the penguin was born after 2007 and belongs to the gentoo species"
  (r["year"] > 2007) and (r["species"] == "Gentoo")
end

# tests the combined condition on rows with different species and years
check:
  gentoo-and-after-2007(penguins-table.row-n(49)) is false
  gentoo-and-after-2007(penguins-table.row-n(227)) is true
  gentoo-and-after-2007(penguins-table.row-n(178)) is false
  gentoo-and-after-2007(penguins-table.row-n(326)) is false
end

# creates a new table with only gentoo penguins born after 2007
gentoo-after-2007 =
  penguins-table.filter(gentoo-and-after-2007)

gentoo-after-2007

# Accumulation 

fun total-flipper(len-list :: List<Number>) -> Number block:
  doc: "takes a list of flipper lengths and returns the total by adding each value to a running sum"
  var total = 0
  for each(n from len-list):
    total := total + n
  end
  total
end

fun avg-flipper(len-list :: List<Number>) -> Number block:
  doc: "takes a list of flipper lengths and returns the average by dividing the total flipper length by the number of penguins in the list"
  var count1 = 0
  for each(n from len-list):
    count1 := count1 + 1
  end
  total-flipper(len-list) / count1
end

# testing both accumulation functions with examples
check:
  total-flipper([list: 176, 190, 210]) is 576
  avg-flipper([list: 176, 190, 210]) is 192
end

# extracts the flipper_length_mm column from the penguins table as a list
flipper-list = penguins-table.column("flipper_length_mm")

# calculates the average flipper length for the entire dataset using avg-flipper
average-flipper-length = avg-flipper(flipper-list)

flipper-list
average-flipper-length
