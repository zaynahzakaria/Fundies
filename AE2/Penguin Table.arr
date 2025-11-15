use context starter2024
include csv
include data-source

penguins-table = load-table:  species, island, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex,year
  source: csv-table-file("penguins.csv", default-options)
  sanitize year using num-sanitizer 
end

penguins-table

# the bill length, bill depth, flipper length, and body mass columns should be sanitized using num-sanitizer but contain NA, only year was correctly sanitized 


penguins-clean =
  penguins-table.filter(lam(r):
      numbers-only(r["body_mass_g"]) and
      numbers-only(r["flipper_length_mm"]) and
      numbers-only(r["year"])
  end)

penguins-clean