use context starter2024

#You sell custom T-shirt designs for £12 each. However, each design requires a £3 setup fee.
#Write an expression to calculate the total cost for 5 identical T-shirts for a custom design.
#Then, write a second expression for 7 identical T-shirts for a design.
#Compare the results.
(12 * 5) + 3
(12 * 7) + 3 

#rectangular poster
#You also print posters. A client wants a 420 by 594mm A2 poster. The price is based on the perimeter of the poster times £0.10p.
#First, compute the perimeter with an expression (remember perimeter = 2 * (width + height)).
#Then, multiply that perimeter by 0.10 to find the cost.
#What happens if you forget parentheses around (width + height)?
perimeter = 2 * (420 + 594)
perimeter * 0.10

#if you do not put a parentheses around width + height then the calucation would be wrong and it wouldn't follow the PEMDAS formula. (It wouldn't be 2 * 1014, it would be 840 + 594)

#Saving a Tagline
#Your T-shirt shop's tagline is: "Designs for everyone!"
#Type it into Pyret as a string.
#Now omit one of the quotes and see the error.
#Fix the error so your string prints correctly.
"designs for everyone"

#Colour Inventory
#You keep track of colours as strings. For instance: "red", "blue", "gold".
#What happens if you try to + them (e.g. "red" + "blue")?
#Reflect: + works on both numbers and strings. What happens if you do 1 + "blue"?
"red" + "blue"
#1 + "red" gives me an error since you cannot add a integer and a string together

#traffic light
base = rectangle(40, 100, "solid", "black")
redcirc = circle(15,"solid","red")
yellowcirc = circle(15,"solid","yellow")
greencirc = circle(15,"solid","green")

trafficlight = overlay-align("center", "middle",above(redcirc,(above(yellowcirc,greencirc))),base)
trafficlight

#trafficlight with pole
pole = rectangle(10,40,"solid","black")
whole = below(pole,trafficlight)
whole

# fix the error of rectangle(50, "solid", 20, "black")
rectangle(50, 20, "solid", "black")

#flag invention
greenrect = rectangle(50,80,"solid","green")
yellowrect = rectangle(50,80, "solid", "yellow")
redrect = rectangle(50,80, "solid","red")
flagbase = beside(greenrect,yellowrect)

wholeflagbase = beside(flagbase,redrect)
wholeflagbase

shield = rotate(45, rectangle(30,30,"solid", "purple"))
overlay-align("center","middle",shield,wholeflagbase)
emblem = rectangle(20,20,"solid","blue")
flaganddiamond = overlay-align("center","middle",shield,wholeflagbase)
overlay-align("center", "middle", emblem, flaganddiamond)