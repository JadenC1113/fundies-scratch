use context starter2024
fun welcome(name):
  "Welcome to class Mr " + name
end
welcome("Kerem")



fun area(width, height):
  width * height
end
area(30,20)


fun shirt-cost(quantity :: Number, length-msg :: String) -> Number:
  #calculation part
  string-l = string-length(length-msg)
  (quantity * 5) + (string-l * 0.1)
end

shirt-cost(4, 'Go Team!') 

fun celcius(c :: Number) -> Number:
  #calculation part 
  (c * 9/5) + 32
end

celcius(0)

celcius(-5)