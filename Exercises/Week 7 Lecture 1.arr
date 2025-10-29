use context starter2024

fun above-5-characters(l):
  cases (List) l:
    | empty      => raise("not defined for empty lists")
    | link(f, r) =>
      if string-length(f) > 5:
          link(f, above-5-characters(r))
        else:
          above-5-characters(r)
        end
  end
end
where:
  above-5-characters([list: "hello", "computer", "science"]) is [list: "computer", "science"]
end



fun my-sum(l):
  cases (List) l:
  | empty => 0
  | link(f, r) => f + my-sum(r)
end

fun my-len(l):
  cases (List) l:
    | empty => 0
    | link (f, r) => 1 + my-len(r)
  end
end
    
fun my-avg(l):
  if length(l) == 0:
    raise("error: empty list")
  else:
    my-sum(l) / my-len(l)
  end
end
where:
my-avg([list: 4, 5, 6, 7]) is 5.5
my-avg([list: 5, 6, 7]) is 6
my-avg([list: 6, 7]) is 6.5
my-avg([list: 7]) is 7
my-avg([list: ]) is "error: empty list"
end
    

      
fun my-max(l):
  m-m1(0, l)
end 

fun m-m1(biggest-number-encounter, l):
  cases (List) l:
    | empty => 0
    | link(f, r) => 
  end
end
    
    
fun my-alternating(l):
  cases (List) l:
    | empty => [list:]
    | link(f, r) =>
      cases (List) r:  
        | empty => 0
            | link(fr, rr) =>
          link(f, my-alternating(rr))
      end
  end
end
      
      
fun my-alternating1(l):
my-a1(true, l)
end

fun my-a1(keep, l):
cases (List) l:
  | empty => empty
  | link(f, r) =>
    ask:
      | keep then: link(f, my-a1(false, r))
      | otherwise: my-a1(true, r)
    end
end 
end 



fun skip-elements(l, skip):
s-e(0, skip, l)
where:
skip-emelemts([list: 1, 2, 3, 4, 5], 2) is [list: 1, 4]
end

fun s-e(current-element, skip, l)
spy:
  current-element
end
cases (List) l:
  | empty => empty
  | link(f, r) => 
    ask: 
      | current-elemnt == skip then: s-e(0, skip, r)
      | otherwise: link(f, s-e(current-element + 1, skip, r))
    end
end
end 