use context starter2024
include csv
include data-source


workouts = table: date :: String, activity :: String, Duration :: Number
  row: "2025-04-01", "Running", 30
end
workouts




table = load-table:
  col1 :: String,
  col2 :: Number,
  col3 :: String,
  col4 :: String,
  col5 :: String,
  col6 :: Number,
  col7 :: String
  
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv", default-options)
    

end 

table.length()

#  source: csv-table-file("recipes.csv", default-options)

gl = load-table:
  patient_id :: Number,
  glucose_level :: Number,
  date :: String,
  inslulin_dose :: Number,
  duration :: Number,
  last-col :: Number
  
  source: csv-table-file("glucose_levels.csv", default-options)
    
  sanitize patient_id using num-sanitizer
  sanitize glucose_level using num-sanitizer
  sanitize inslulin_dose using num-sanitizer
  sanitize duration using num-sanitizer
  sanitize last-col using num-sanitizer
    
end
  
gl
  
  