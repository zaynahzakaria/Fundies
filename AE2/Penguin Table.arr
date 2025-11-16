use context starter2024
include csv
include data-source

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
  
body-mass-kg = body-mass.map(lam(m): m / 1000 end)
  
body-mass-kg 

# transformation 


# selection 

penguins-after-2007 =
  penguins-table.filter(lam(r):
    r["year"] > 2007
  end)

penguins-after-2007
