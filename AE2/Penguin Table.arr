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

# scalar processing
body-mass = extract body_mass_g from penguins-table 
end
  
fun body-mass-kg(m :: Number) -> Number:
  m / 1000
end
check:
  map(body-mass-kg, [list: 2700, 4600, 6000])
    is [list: 2.7, 4.6, 6]
end

body-mass-kg 

# transformation 
weight-categorised =
  build-column(penguins-table, "weight", lam(r):
    if r["body_mass_g"] < 4000:
      "light"
    else if r["body_mass_g"] < 5000:
      "medium"
    else:
      "heavy"
    end
  end)

weight-categorised

# selection 

penguins-after-2007 =
  penguins-table.filter(lam(r):
    r["year"] > 2007
  end)

penguins-after-2007

# accumulation 

fun total-flipper(len-list :: List<Number>) -> Number block:
  var total = 0
  for each(n from len-list):
    total := total + n
  end
  total
end

fun avg-flipper(len-list :: List<Number>) -> Number block:
  var count1 = 0
  for each(n from len-list):
    count1 := count1 + 1
  end

  total-flipper(len-list) / count1
end

flipper-list = penguins-table.column("flipper_length_mm")
average-flipper-length = avg-flipper(flipper-list)

flipper-list

average-flipper-length
