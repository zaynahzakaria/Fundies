use context starter2024
# Question 1: Python
y = 100

def outer():
    y = 200
    def inner():
        global y
        y = y + 50
        return y
    return inner()
    
print(outer())


# Question 2: Pyret 
var x = 10
fun f() block:
  x := x + 5
  x
end
f()


# Question 3: Python
x = 10

def foo():
    global x
    x = x + 1
    return x

print(foo())


# Question 4: Pyret
var a = 10

fun inc() block:
  a := a + 1
  a
end

inc()
a