(* Split a list into two parts; the length of the first part is given. (easy)

If the length of the first part is longer than the entire list, then the first part is the list and the second part is empty.
*)

let rec take n xs = match (n, xs) with
  | (_, []) | (0, _) -> []
  | (_, y::ys) -> y::(take (n-1) ys)

let rec skip n xs = match (n, xs) with
  | (_, []) | (0, _) -> xs
  | (_, y::ys) -> skip (n-1) ys

let split xs n = (take n xs, skip n xs)



let _ = assert ((split ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 3) = 
  (["a"; "b"; "c"], ["d"; "e"; "f"; "g"; "h"; "i"; "j"]))
let _ = assert ((split ["a";"b";"c";"d"] 5) = (["a"; "b"; "c"; "d"], []))

