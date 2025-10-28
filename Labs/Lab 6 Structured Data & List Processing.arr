use context dcic2024
include lists 
include data-source
include csv

gate-exams = load-table: Name, Surname, Email, Score
  source:
    csv-table-file("students_gate_exam_score.csv", default-options)
end