use context dcic2024
include image
include csv
include data-source

# 1. Task Plan
# Problem 1: The carrier column has inconsistent formatting (upper/lowercase errors & spaces).
# Planned Step 1: "Clean the carrier column by converting text to uppercase & getting rid of spaces."
# Implementation 1: Use string-replace & string-to-lower.
# Problem 2: The tailnum column has missing data.
# Planned Step 2: "Replace missing values with "UNKNOWN"."
# Implementation 2: Use transform-column with a lambda expression.
# Problem 3: The dep-delay and arr-delay have negative values.
# Planned Step 3: "Replace all negative values with 0."
# Implementation 3: Use transform-column with a lambda expression.
# Problem 4: Some columns have dumplicate values.
# Planned Step 4: "Identify dublicate rows."
# Implementation 4: Use filter with a lamdba expression. 


# 2. Handle Missing Data, Clean Data, and Identify Duplicates
flights_53 = load-table:
  rownames, dep-time, sched-dep-time, dep-delay, arr-time, sched-arr-time, arr-delay, carrier, flight, tailnum, origin, dest, air-time, distance, hour, minute, time-hour
  source: csv-table-file("flights_sample53.csv", default-options)
  sanitize rownames using num-sanitizer
  sanitize dep-time using num-sanitizer
  sanitize sched-dep-time using num-sanitizer
  sanitize dep-delay using num-sanitizer
  sanitize arr-time using num-sanitizer
  sanitize sched-arr-time using num-sanitizer
  sanitize arr-delay using num-sanitizer
  sanitize flight using num-sanitizer
  sanitize air-time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
  end
