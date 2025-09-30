use context dcic2024
fun leap-year-calculation(year :: Number) -> Boolean:
  if num-modulo(year, 4) == 0: true
  else: false
end
where:
  leap-year-calculation(2024) is true
  leap-year-calculation(2025) is false
end