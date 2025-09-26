use context dcic2024
include csv
include data-source

table1 = load-table:
  plant-name, location-longitute, location-latitude, date-sighted, soil-type, height, color
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv", default-options)
end

table1
table1.row-n(2)
table1.length()
table1.row-n(99)

#First, make up some columns, but the error should tell you how many there should be
#Use the interactions window, .row-n, and the column extraction to explore the data a little bit.
#Check the total number of rows with table-identifier.length(). What happens if you try to do table-identifier.row-n(M) for M that is greater than the total number of rows?
#Similarly, try extracting a column that doesn't exist.

glucose_levels = load-table:
  patient_id,glucose_level, date_time, insulin_dose, exercise_duration, stress_level
  source: csv-table-file("glucose_levels.csv", default-options)
  sanitize patient_id using num-sanitizer 
  sanitize glucose_level using num-sanitizer 
  sanitize insulin_dose using num-sanitizer 
  sanitize exercise_duration using num-sanitizer 
  sanitize stress_level using num-sanitizer 
end

glucose_levels 
sum(glucose_levels, "insulin_dose")
mean(glucose_levels, "stress_level")

#Unzip the glucose_levels.zip and the upload the glucose_levels.csv file to VS Code
#Import glucose_levels.csv using csv-table-file
#Use the sanitizer to convert the columns with numeric data into numbers
#Use some of the functions for summarising columns and plotting tables on the dataset