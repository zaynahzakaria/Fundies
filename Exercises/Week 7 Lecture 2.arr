use context starter2024
# 1
fun count-streams(r):
  cases (River) r:
    | stream(flow) => 1
    | merge(width, left, right) => count-streams(left) + count-streams(right)
  end
where:
  count-streams(merge-1) is 2
  count-streams(main-river) is 3
end

# 2
fun max-width(r):
  cases (River) r:
    | stream(flow) => 0
    | merge(width, left, right) => num-max(width, num-max(max-width(left), max-width(right)))
  end
where:
  max-width(main-river) is 15
  max-width(merge-1) is 12
end

#3 
fun widen-river(r, wider):
  cases (River) r:
    | merge(width, left, right) => 
      merge(
        1 + wider,
        widen-river(left, wider),
        widen-river(right, wider))
    | stream(f) => stream(f)
  end
where:
  widen-river(main-river, 10).width is 25
  widen-river(main-river, 10).left.width is 22

#4
fun cap-flow(r, cap):
  cases (River) r:
    | stream(flow) =>
        if flow > cap:
          stream(cap)
        else:
          stream(flow)
        end
    | merge(width, left, right) =>
        merge(width, cap-flow(left, cap), cap-flow(right, cap))
  end
where:
  cap-flow(stream(18), 10) is stream(10)
  cap-flow(stream(5), 10) is stream(5)
end
  
#5 
fun has-large-stream(r):
  cases (River) r:
    | stream(flow) => flow > 5
    | merge(width, left, right) =>
        has-large-stream(left) or has-large-stream(right)
  end
where:
  has-large-stream(stream(3)) is false
  has-large-stream(stream(8)) is true
  has-large-stream(main-river) is true
  has-large-stream(merge-1) is false
end  