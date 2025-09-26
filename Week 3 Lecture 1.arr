fun choose-hat(temp-in-C :: Number) -> String:
  doc:"this function determines the appropriate head gear, with above 27C a sun hat, below nothing"
  
  if temp-in-C > 27:
    "Wear sun hat while going out today!"
  else if temp-in-C < 10:
    "Bring a winter hat! It's cold outside!"
  else:
    "The weather is good, you don't need a hat today!"
  end #to end the if condition
  
  
end #to end the function

#functioncall
choose-hat(2)

fun choose-outfit(temp-in-C :: Number) -> String:
  doc: "this function adds glasses to the outfit"
  
  ask:
    |temp-in-C > 27 then:
      "where a sun hat while going out today!"
    |temp-in-C <= 27 then:
      ask:
        |temp-in-C < 10 then:
          "It's too cold, wear a winter hat today"
        |otherwise:
          "The weather is good, you don't need a hat today!"
        
      end
  end
end

choose-outfit(10)