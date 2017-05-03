(* Create a list containing all integers within a given range. (easy)

If first argument is greater than second, produce a list in decreasing order.
*)

let rec range from _to = 
  if from = _to then [_to]
  else if from > _to then from::(range (from - 1) _to)
  else from::(range (from + 1) _to)


let _ = assert ((range 4 9) = [4; 5; 6; 7; 8; 9])
let _ = assert ((range 9 4) = [9; 8; 7; 6; 5; 4])

