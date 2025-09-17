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
black-rectangle = rectangle(25, 65, "solid", "black")

#3.2
red-circle = circle(10, "solid", "red")
yellow-circle = circle(10, "solid", "yellow")
green-circle = circle(10, "solid", "green")
i1 = above(red-circle, yellow-circle)
i2 = above(i1, green-circle)
traffic-light = underlay-align("center", "middle", black-rectangle, i2)
traffic-light

#3.3
rectangle2 = rectangle(5, 15, "outline", "black")
traffic-light2 = above(traffic-light, rectangle2)
traffic-light2

#4.1
rectangle(50, 20, "solid", "black")

#4.2
circle(30, "solid", "red")

#5.1
pink-rectangle = rectangle(100, 60, "solid", "pink")
gray-circle = circle(25, "solid", "gray")
flag1 = overlay(gray-circle, pink-rectangle)
white-star = star(15, "solid", "white")
purple-star = star(24, "solid", "purple")
flag2 = overlay(white-star, purple-star)
flag = overlay(flag2, flag1)
flag

#5.2
gray-square = rotate(45, square(100, "solid", "gray"))
pink-circle = circle(40, "solid", "pink")
yellow-star = star(20, "solid", "yellow")
shield1 = overlay(yellow-star, pink-circle)
shield = overlay(shield1, gray-square)
shield
