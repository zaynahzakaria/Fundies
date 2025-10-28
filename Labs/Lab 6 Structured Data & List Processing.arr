use context dcic2024
include lists 
include data-source
include csv

# Task 1
gate-exams = load-table: Name, Surname, Email, Score
  source:
    csv-table-file("students_gate_exam_score.csv", default-options)
  sanitize Score using num-sanitizer
end

ordered = order-by(gate-exams, "Score", false)

row1 = ordered.row-n(0)
row2 = ordered.row-n(1)
row3 = ordered.row-n(2)

data Students:
    students(Name :: String, Surname :: String, Score :: Number)
end

s1 = students(row1["Name"], row1["Surname"], row1["Score"])
s2 = students(row2["Name"], row2["Surname"], row2["Score"])
s3 = students(row3["Name"], row3["Surname"], row3["Score"])

scores :: List<Number> = 
  link(s1.Score, link(s2.Score, link(s3.Score, empty))) 

fun above-90(l):
  cases (List) l:
    | empty => 0
    | link(f, r) => (if f > 90: 1 else: 0 end) + above-90(r)
  end 
where:
  above-90([list: 97, 84, 91]) is 2
end 


# Task 2
all-emails = gate-exams.get-column("Email")
 
fun get-domain(all-emails :: String)
  index1 = string-split(all-emails, "@")
  index0 = string-split(index1, ".")
  university-name = 