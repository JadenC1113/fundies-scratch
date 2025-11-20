use context starter2024

data TaxonomyTree:
    node(rank :: String, name :: String, children :: List<TaxonomyTree>)
end 

#example

lion = node("Species", "Panthera leo", [list: ])
tiger = node("Species", "Panthera tigris", [list: ])
leopard = node("Species", "Panthera pardus", [list: ])
panthera = node("Genus", "Panthera", [list: lion, tiger, leopard])

house-cat = node("Species", "Felist catus", [list: ])
wildcat = node("Species", "Felist slivestris", [list: ])
felis = node("Fenus", "Felis", [list: house-cat, wildcat])

felidae = node("Family", "Felidae", [list: panthera, felis])
