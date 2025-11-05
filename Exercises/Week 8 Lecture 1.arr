use context starter2024
data TaxonomyTree:
  node(rank :: String, name :: String, children :: List<TaxonomyTree>)
end

# Example: Part of the cat family
lion = node("Species", "Panthera leo", [list: ])
tiger = node("Species", "Panthera tigris", [list: ])
leopard = node("Species", "Panthera pardus", [list: ])
panthera = node("Genus", "Panthera", [list: lion, tiger, leopard])

house-cat = node("Species", "Felis catus", [list: ])
wildcat = node("Species", "Felis silvestris", [list: ])
felis = node("Genus", "Felis", [list: house-cat, wildcat])

felidae = node("Family", "Felidae", [list: panthera, felis])

# 1 Design a function count-species that takes a TaxonomyTree and counts the number of nodes with the rank Species.
fun count-species(t :: TaxonomyTree) -> Number:
  if t.rank == "Species":
    1 + count-species-children(t.children)
  else:
    count-species-children(t.children)
  end
end

fun count-species-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0 
    | link(first, rest) =>
      count-species(first) + count-species-children(rest)
  end
end 

# Design a function count-rank which takes a TaxonomyTree and a rank string that returns the number of nodes with that rank.
fun count-rank(t :: TaxonomyTree, r :: String) -> Number:
  if t.rank == r:
    1 + count-species-children(t.children, r)
  else:
    count-species-children(t.children, r)
  end
end

fun count-rank-children(c :: List<TaxonomyTree>, r :: String) -> Number:
  cases (List) c:
    | empty => 0
    | link (first, rest) =>
      count-rank(first, r) + count-rank-children(first, r)
  end 
end

# Design a function taxon-height that returns the number of levels in the TaxonomyTree (root is level 1). Use a num-max to determine height as we do not need to count all the branches, just the longest one (the deepest leaf).