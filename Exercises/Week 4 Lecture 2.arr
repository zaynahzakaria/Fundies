use context starter2024
include tables 

items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
  row: "Sword of Dawn",           23,  -87
  row: "Healing Potion",         -45,   12
  row: "Dragon Shield",           78,  -56
  row: "Magic Staff",             -9,   64
  row: "Elixir of Strength",      51,  -33
  row: "Cloak of Invisibility",  -66,    5
  row: "Ring of Fire",            38,  -92
  row: "Boots of Swiftness",     -17,   49
  row: "Amulet of Protection",    82,  -74
  row: "Orb of Wisdom",          -29,  -21
end

fun new-x(x-coordinate :: Number) -> Number:
  doc: "brings the items closer by 10%"
  x-coordinate * 0.9
where:
  new-x(23) is 20.7
  new-x(-17) is -15.3
end

fun new-y(y-coordinate :: Number) -> Number:
  doc: "brings the items closer by 10%"
  y-coordinate * 0.9
where:
  new-y(12) is 10.8
  new-y(-33) is -29.7
end

fun closer-x(items1 :: Table) -> Table:
  doc: "brings all the items closer to the plyer by 10%"
  closer-x(items, "x-coordinate", new-x)
end

fun closer-y(items2 :: Table) -> Table:
  doc: "brings all the items closer to the plyer by 10%"
  closer-y(items, "y-coordinate", new-y)
end

closer-items = table:
  item :: String, x-coordinate :: Number, y-coordinate :: Number
  row: "Sword of Dawn",           new-x(23),   new-y(-87)
  row: "Healing Potion",          new-x(-45),  new-y(12)
  row: "Dragon Shield",           new-x(78),   new-y(-56)
  row: "Magic Staff",             new-x(-9),   new-y(64)
  row: "Elixir of Strength",      new-x(51),   new-y(-33)
  row: "Cloak of Invisibility",   new-x(-66),  new-y(5)
  row: "Ring of Fire",            new-x(38),   new-y(-92)
  row: "Boots of Swiftness",      new-x(-17),  new-y(49)
  row: "Amulet of Protection",    new-x(82),   new-y(-74)
  row: "Orb of Wisdom",           new-x(-29),  new-y(-21)
end

fun distance(r :: Row) -> Number:
  num-sqrt(num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"]))
end

