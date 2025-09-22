use context starter2024
# I partnered with Charlie Yanai for this Lab
import file("lab2-support.arr") as support

"Testing Encryptor #1"
support.encryptor1("testing ")

support.encryptor1("loop de loop ")

fun myEncryptor1(input :: String) -> String:
  string-repeat(input, 5)
end

support.test-encryptor1(myEncryptor1)

"Testing Encryptor #2"

support.encryptor2("test")
support.encryptor2("Words but like more")
support.encryptor2("Crane")

fun myEncryptor2(input:: String) -> String:
  #prints the first 4 letters/characters
  string-substring(input, 0, 4)
  
end

#

myEncryptor2("test")
myEncryptor2("Words but like more")
myEncryptor2("Crane")

support.test-encryptor2(myEncryptor2)


"Testing Encryptor #3"

support.encryptor3("hello my name is:::")
support.encryptor3("2048")
support.encryptor3("HELLO MY NAME IS...")
support.encryptor3("NOSPACESTEST")
support.encryptor3("ZXCVBNMASDFGHJKLQWERTYUIOP")

fun myEncryptor3(input :: String) -> String:
  string-replace(input,".","!")
end
support.test-encryptor3(myEncryptor3)


"Tester Encryptor #4"

support.encryptor4("ONsuhd")
support.encryptor4("Swedish.")
support.encryptor4("...!?")

fun myEncryptor4(input :: String) -> String:
  string-repeat(string-substring(input, 0, 4),5)
end
support.test-encryptor4(myEncryptor4)
"Testing Encryptor #5"


support.encryptor5("hello.")
support.encryptor5("aeiouy.")
support.encryptor5("!@#$%^&*().?")
support.encryptor5("AEIOU.")


fun myEncryptor5(input :: String) -> String:
  string-replace(  string-replace(  string-replace( string-replace(string-replace(  string-replace(  string-replace(string-replace(string-replace(string-replace(input,"U","V"),"u","v"),"O","P"),"o","p"),"I","J"),"i","j"),"E","F"),"e","f"),"A","B"),"a","b")
  
end
support.test-encryptor5(myEncryptor5)

"Testing Encryptor #6"
support.encryptor6("hello.")
support.encryptor6("HELLO123")
support.encryptor6("!@#$%^&*().?")
support.encryptor6(" 'HI NAME: little';")
support.encryptor6("ZXCVBNMASDFGHJKLQWERTYUIOP")
support.encryptor6("RRRRRRRr")

fun myEncryptor6(input :: String) -> String:
  string-tolower(string-replace(string-replace(input,"r",""),"R",""))
end
support.test-encryptor6(myEncryptor6)

"Testing Encryptor #7"

support.encryptor7("hello.")
support.encryptor7("HELLO123")
support.encryptor7("!@#$%^&*().?")
support.encryptor7(" 'HI NAME: little';")
support.encryptor7("ZXCVBNMASDFGHJKLQWERTYUIOP")
support.encryptor7("RRRRRRRr")

fun myEncryptor7(input :: String) -> Number:
  string-length(input)
end
support.test-encryptor7(myEncryptor7)

"Testing Encryptor #8"
support.encryptor8("hello.")
support.encryptor8("HELLO123")
support.encryptor8("!@#$%^&*().?")
support.encryptor8(" 'HI NAME: little';")
support.encryptor8("ZXCVBNMASDFGHJKLQWERTYUIOP")

fun myEncryptor8(input :: String) -> String:
  string-repeat(input + "!!!",3)
end
support.test-encryptor8(myEncryptor8)

"Testing Encryptor #9"
support.encryptor9("a")
support.encryptor9("ab")
support.encryptor9("abc")
support.encryptor9("bbc")
support.encryptor9("cbc")
support.encryptor9("A")
support.encryptor9("AB")
support.encryptor9("BBC")
support.encryptor9("Z")
support.encryptor9("!")
support.encryptor9("?")
support.encryptor9(".")

fun myEncryptor9(input :: String) -> Number:
  string-to-code-point(string-substring(input,0,1))
end
support.test-encryptor9(myEncryptor9)


"Testing Encryptor #10"

support.encryptor10("hello.")
support.encryptor10("HELLO123")
support.encryptor10("!@#$%^&*().?")
support.encryptor10(" 'HI NAME: little';")
support.encryptor10("ZXCVBNMASDFGHJKLQWERTYUIOP")
support.encryptor10("12345")
support.encryptor10("AEIOU")

support.encryptor10("chirp")

fun myEncryptor10(input :: String) -> String:

 
  
  string-repeat(string-to-lower(string-substring(myEncryptor5(string-replace(string-replace(input,"r",""),"R","")),0,4)),5)
  
end

myEncryptor10("chirp")


support.test-encryptor10(myEncryptor10)