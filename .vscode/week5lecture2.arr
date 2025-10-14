use context starter2024
import math as M
import statistics as S

cafe-data =
  table: day, drinks-sold
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end

cafe-data.get-column("drinks-sold")

sample-list = [list: 45, 30, 55, 40, 60]
sample-list

empty-list = [list: ]
empty-list 

sales = cafe-data.get-column("drinks-sold")
M.min(sales)      # minimum sales 
M.max(sales)      # maximum sales
S.mean(sales)     # average sales
M.sum(sales)      # total sold

fun compute-product(num-list :: List<Number>) -> Number block:
  