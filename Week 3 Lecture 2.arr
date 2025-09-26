use context dcic2024
include csv
include data-source

table1 = load-table:
  plant-name, location-longitute, location-latitude, date-sighted, soil-type, height, color
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv", default-options)
end


#First, make up some columns, but the error should tell you how many there should be
#Use the interactions window, .row-n, and the column extraction to explore the data a little bit.
#Check the total number of rows with table-identifier.length(). What happens if you try to do table-identifier.row-n(M) for M that is greater than the total number of rows?
#Similarly, try extracting a column that doesn't exist.