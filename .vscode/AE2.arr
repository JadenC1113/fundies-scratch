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

# Convert the table to a list of Penguin records for list processing
PENGUIN-LIST = 
  transform table: Penguins
    using species: species, island: island, 
           bill_length_mm: bill_length_mm, bill_depth_mm: bill_depth_mm,
           flipper_length_mm: flipper_length_mm, body_mass_g: body_mass_g,
           sex: sex, year: year
    into: penguin(species, island, bill_length_mm, bill_depth_mm, 
                  flipper_length_mm, body_mass_g, sex, year)
  end

# STEP 2: CREATE EXAMPLE PENGUINS FOR TESTING
# These concrete examples help us develop and test our functions

example-adelie = penguin("Adelie", "Torgersen", 39.1, 18.7, 181, 3750, "male", 2007)
example-gentoo = penguin("Gentoo", "Biscoe", 49.9, 16.1, 212, 5400, "female", 2009)
example-chinstrap = penguin("Chinstrap", "Dream", 52.2, 20.8, 210, 4800, "male", 2008)

# Create a small example list for testing
example-penguin-list = [list: example-adelie, example-gentoo, example-chinstrap]

# TECHNIQUE 1: SCALAR PROCESSING
# Problem: Extract the bill length from a single penguin record
# Why: Foundation for accessing individual fields from structured data

fun get-bill-length(p :: Penguin) -> Number:
  # Simply access the bill_length_mm field from the Penguin record
  p.bill_length_mm
where:
  # Test with our concrete examples
  get-bill-length(example-adelie) is 39.1
  get-bill-length(example-gentoo) is 49.9
  get-bill-length(example-chinstrap) is 52.2
end

# Demonstrate scalar processing on actual data
first-penguin-bill-length = get-bill-length(PENGUIN-LIST.first)


# TECHNIQUE 2: TRANSFORMATION
# Problem: Convert all penguin body masses from grams to kilograms
# Why: Apply the same conversion operation to every element in the list


fun mass-to-kg(p :: Penguin) -> Number:
  # Transform grams to kilograms by dividing by 1000
  p.body_mass_g / 1000
where:
  # Test the transformation on individual records
  mass-to-kg(example-adelie) is 3.75
  mass-to-kg(example-gentoo) is 5.40
  mass-to-kg(example-chinstrap) is 4.80
end

fun get-all-masses-kg(lop :: List<Penguin>) -> List<Number>:
  # Use map to apply mass-to-kg to every penguin in the list
  map(lop, mass-to-kg)
where:
  # Test the list transformation
  get-all-masses-kg(example-penguin-list) is [list: 3.75, 5.40, 4.80]
  get-all-masses-kg(empty) is empty
end

# Apply transformation to the full dataset
all-masses-kg = get-all-masses-kg(PENGUIN-LIST)

# TECHNIQUE 3: SELECTION  
# Problem: Find all penguins from Torgersen Island
# Why: Filter the dataset to focus on a specific subgroup

fun is-from-torgersen(p :: Penguin) -> Boolean:
  p.island == "Torgersen"
end

fun get-torgersen-penguins(lop :: List<Penguin>) -> List<Penguin>:
  filter(lop, is-from-torgersen)
where:
  get-torgersen-penguins(example-penguin-list) is [list: example-adelie]
  get-torgersen-penguins(empty) is empty
end

# Get all Torgersen penguins from the full dataset.
torgersen-penguins = get-torgersen-penguins(PENGUIN-LIST)

   
# TECHNIQUE 4: ACCUMULATION
# Problem: Calculate the total body mass of all penguins in kilograms
# Why: Combine values from multiple records into a single summary statistic

# ACCUMULATION FUNCTION FOR SUMMING BODY MASSES
    # This is the core accumulation that was missing. Using fold to sum values

# Accumulator function that adds each penguin's mass to running total
fun add-body-mass(accumulator :: Number, current-penguin :: Penguin) -> Number:
  # Add current penguin's body mass (in grams) to the running total
  accumulator + current-penguin.body_mass_g
where:
  # Test the accumulation step by step
  add-body-mass(0, example-adelie) is 3750
  add-body-mass(3750, example-gentoo) is 3750 + 5400  # = 9150
  add-body-mass(9150, example-chinstrap) is 9150 + 4800  # = 13950
end


# APPLY FOLD FOR ACCUMULATION
# Use fold to process the entire list and accumulate the total mass


fun total-body-mass-grams(lop :: List<Penguin>) -> Number:
  # Start with initial accumulator 0, then add each penguin's mass
  fold(lop, add-body-mass, 0)
where:
  # Test with our example list
  total-body-mass-grams(example-penguin-list) is 3750 + 5400 + 4800  # = 13950
  total-body-mass-grams([list: example-adelie]) is 3750
  total-body-mass-grams(empty) is 0
end


# CALCULATE AVERAGE USING ACCUMULATION RESULTS
# Combine accumulation with other operations to get meaningful statistics


fun average-body-mass-kg(lop :: List<Penguin>) -> Number:
  total-grams = total-body-mass-grams(lop)
  count = length(lop)
  if count > 0:
    # Convert total grams to kilograms and divide by count
    (total-grams / 1000) / count
  else:
    raise("Cannot calculate average of empty list")
  end
where:
  # Test average calculation: (3.75 + 5.40 + 4.80) / 3 = 4.65
  average-body-mass-kg(example-penguin-list) is (3.75 + 5.40 + 4.80) / 3
end

# Apply accumulation to full dataset
    total-mass-all-penguins-g = total-body-mass-grams(PENGUIN-LIST)
average-mass-all-penguins-kg = average-body-mass-kg(PENGUIN-LIST)

    #MORE ACCUMULATION EXAMPLES - COUNT BY SPECIES
# Another accumulation: count penguins of each species using fold


# Accumulator function for counting species
fun count-species(accumulator :: {String => Number}, current-penguin :: Penguin) -> {String => Number}:
  species-name = current-penguin.species
  current-count = accumulator.get-value(species-name) or-else 0
  accumulator.set(species-name, current-count + 1)
where:
  test-accumulator = {string-dict: "Adelie" => 1}
  count-species(test-accumulator, example-adelie).get-value("Adelie") is 2
  count-species(test-accumulator, example-gentoo).get-value("Gentoo") is 1
end

fun count-all-species(lop :: List<Penguin>) -> {String => Number}:
  # Start with empty dictionary, count each penguin's species
  fold(lop, count-species, {string-dict:})
end

# Get species counts using accumulation
species-counts = count-all-species(PENGUIN-LIST)

    #ACCUMULATION TO FIND MAXIMUM FLIPPER LENGTH
# Using fold to find the maximum value in a list


fun find-max-flipper(accumulator :: Number, current-penguin :: Penguin) -> Number:
  if current-penguin.flipper_length_mm > accumulator:
    current-penguin.flipper_length_mm
  else:
    accumulator
  end
where:
  find-max-flipper(0, example-adelie) is 181
  find-max-flipper(181, example-gentoo) is 212  # 212 > 181, so returns 212
  find-max-flipper(212, example-chinstrap) is 212  # 210 < 212, so returns 212
end

fun max-flipper-length(lop :: List<Penguin>) -> Number:
  if lop.is-empty:
    raise("Cannot find max of empty list")
  else:
    # Start with first penguin's flipper length as initial max
    fold(lop.rest, find-max-flipper, lop.first.flipper_length_mm)
  end
where:
  max-flipper-length(example-penguin-list) is 212  # From example-gentoo
end

# Find maximum flipper length in dataset
max-flipper-all = max-flipper-length(PENGUIN-LIST)


# COMBINED ANALYSIS: USING ALL FOUR TECHNIQUES TOGETHER
# Problem: Find average body mass of female Gentoo penguins in kilograms
# This demonstrates how the techniques work together for complex analysi

# STEP 1: Selection - Get only female Gentoo penguins
fun is-female-gentoo(p :: Penguin) -> Boolean:
  (p.species == "Gentoo") and (p.sex == "female")
end

female-gentoos = filter(PENGUIN-LIST, is-female-gentoo)

# STEP 2: Transformation - Convert their masses to kilograms  
female-gentoo-masses-kg = map(female-gentoos, mass-to-kg)

# STEP 3: Accumulation - Sum all the masses using a different accumulator
fun sum-kg-masses(acc :: Number, mass-kg :: Number) -> Number:
  acc + mass-kg
end

total-female-gentoo-mass-kg = fold(female-gentoo-masses-kg, sum-kg-masses, 0)

# STEP 4: Calculate final average using scalar division
avg-female-gentoo-mass = 
  if length(female-gentoo-masses-kg) > 0:
    total-female-gentoo-mass-kg / length(female-gentoo-masses-kg)
  else:
    0
  end


# Test scalar processing
fun test-scalar-processing():
  examples-pass = (get-bill-length(example-adelie) == 39.1) and
                  (get-bill-length(example-gentoo) == 49.9)
  examples-pass
end

# Test transformation  
fun test-transformation():
  masses = get-all-masses-kg(example-penguin-list)
  masses == [list: 3.75, 5.40, 4.80]
end

# Test selection
fun test-selection():
  torgersen = get-torgersen-penguins(example-penguin-list)
  torgersen == [list: example-adelie]
end

# Test accumulation
fun test-accumulation():
  total-mass = total-body-mass-grams(example-penguin-list)
  average-mass = average-body-mass-kg(example-penguin-list)
  max-flipper = max-flipper-length(example-penguin-list)
  
  (total-mass == 13950) and
  (average-mass == (3.75 + 5.40 + 4.80) / 3) and
  (max-flipper == 212)
end

# Run all tests
all-tests-pass = test-scalar-processing() and test-transformation() and 
                 test-selection() and test-accumulation()

print("All tests pass: " + all-tests-pass.to-string())