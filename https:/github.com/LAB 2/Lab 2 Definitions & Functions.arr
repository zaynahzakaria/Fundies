use context starter2024

import file("lab2-support.arr") as support

s = "HELLO world"
s2 = "abcdefghijklmnopqrstuvwxyz"
s3 = "100"

#repeats the string 5 times
support.encryptor1(s)
support.encryptor1(s2)

# restricts string to 4 letters
support.encryptor2(s)
support.encryptor2(s2)

# returns the string as it is
support.encryptor3(s)
support.encryptor3(s2)
support.encryptor3(s3)

# restricts the string to 4 letters and repeats it 5 times
support.encryptor4(s)
support.encryptor4(s2)

# replaces all the vowels, not including y, with the letter that comes after it in the alphabet
support.encryptor5(s)
support.encryptor5(s2)

# removes the letter R and converts to lowercase
support.encryptor6(s)
support.encryptor6(s2)

# counts all the characters in the strong, including spaces, and displays the string length
support.encryptor7(s)
support.encryptor7(s2)

# adds three exclamation marks at the end of the string and repeats that 3 times
support.encryptor8(s)
support.encryptor8(s2)

# looks at first letter or number of the string and returns a number to a character code which is a number corresponding to its Unicode point
support.encryptor9(s)
support.encryptor9(s2)
support.encryptor9(s3)

# converts to lowercase, restricts the string to four letters, replaces the vowels, not including y, with the letter that comes after it in the alphabet, and repeats that 5 times
support.encryptor10(s)
support.encryptor10(s2)



# my recreation of the function
fun my-encryptor1(m :: String) -> String:
  doc: "capitalizes the string and repeats it 3 times"
  string-to-upper(string-repeat(m, 3))
end 

# calling my-encryptor with variety of sample strings
my-encryptor1("one")
my-encryptor1("hello world")
my-encryptor1("london")

# passing my function to the provided tester
support.test-encryptor1(my-encryptor1)

# testing my function
  check:
  my-encryptor1("northeastern") is "NORTHEASTERNNORTHEASTERNNORTHEASTERN"
  my-encryptor1("ABCD") is "ABCDABCDABCD"
  my-encryptor1("lab") is "LABLABLAB"
end
