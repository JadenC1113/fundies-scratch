use context starter2024
include csv
include data-source


workouts = table: date :: String, activity :: String, Duration :: Number
  row: "2025-04-01", "Running", 30
end
workouts




table = load-table:
  col1 :: String
  
  
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv", default-options)
    

end 
