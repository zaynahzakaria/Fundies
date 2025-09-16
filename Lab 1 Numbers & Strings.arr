use context starter2024
# 1.1
(12 * 5) + 3
(12 * 7) + 3

#1.2
perimeter = 2 * (420 + 594)
price = perimeter * 0.10
price 

#2.1
"Designs for everyone!"

#2.2
"blue"
"pink"
"red"
"blue" + "red"

#3.1
r = rectangle(20, 60, "solid", "black")

#3.2
c1 = circle(10, "solid", "red")
c2 = circle(10, "solid", "yellow")
c3 = circle(10, "solid", "green")
stack = above(c1, above(c2, c3))
overlay(stack, r)

#3.3
r2 = rectangle(5, 15, "outline", "black")
traffic_light = above(r, r2)
traffic_light

#4.1
rectangle(50, 20, "solid", "black")

#4.2
circle(30, "solid", "red")

#5.1
b = rectangle(100, 60, "solid", "pink")
c = circle(25, "solid", "gray")
f1 = overlay(c, b)
s = star(15, "solid", "white")
s2 = star(24, "solid", "purple")
f2 = overlay(s, s2)
flag = overlay(f2, f1)
flag

#5.2
shield = rotate(45, square(100, "solid", "gray"))
ec = circle(40, "solid", "pink")
es = star(20, "solid", "white")
ce = overlay(es, ec)
shield_design = overlay(ce, shield)
shield_design
