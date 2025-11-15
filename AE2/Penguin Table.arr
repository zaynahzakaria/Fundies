use context starter2024
include csv
include data-source

table = load-table:
  species, island, bill-length-mm, bill-depth-mm, flipper-length-mm, body-mass-g, sex
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv", default-options)
end