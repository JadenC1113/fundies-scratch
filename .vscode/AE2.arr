use context dcic2024

include csv
include data-source

# Data Definition for a Penguin
data Penguin:
  | penguin(
  species :: String,
  island :: String,
      bill_length_mm :: Number,
      bill_depth_mm :: Number,
      flipper_length_mm :: Number,
      body_mass_g :: Number,
  sex :: String,
  year :: Number)
end

# Import data table of penguin.csv file
Penguins = load-table:
  item :: Number,
  species :: String,
  island :: String,
  bill_length_mm :: Number,
  bill_depth_mm :: Number,
  flipper_length_mm :: Number,
  body_mass_g :: Number,
  sex :: String,
  year :: Number
source: csv-table-file("penguins.csv", default-options)
    
# Sanatize the values
  sanitize item using num-sanitizer
  sanitize bill_length_mm using num-sanitizer
  sanitize bill_depth_mm using num-sanitizer
  sanitize flipper_length_mm using num-sanitizer
  sanitize body_mass_g using num-sanitizer
  sanitize year using num-sanitizer
end
    