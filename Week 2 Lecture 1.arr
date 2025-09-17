use context starter2024
blue-triangle = triangle(35, "solid", "blue")

side-length = 40
color ="green"
green-square = square(side-length, "solid", color) 

green-square2 = square(40, "solid", "green")

black-rectangle = rectangle(40, 80, "solid", "black")
yellow-circle = circle(5, "solid", "yellow")
overlay(yellow-circle, black-rectangle)
yellow-circle2 = circle(5, "solid", "yellow")
circles = beside-align("center", yellow-circle, yellow-circle2)
overlay(circles, black-rectangle)

purple-rectangle = rectangle(80, 60, "solid", "purple")
purple-rectangle
pink-rectangle = rectangle(80, 20, "solid", "pink")
pink-rectangle
flag1 = overlay(pink-rectangle, purple-rectangle)
white-star = star(10, "solid", "white")
flag2 = overlay(white-star, flag1)
flag2