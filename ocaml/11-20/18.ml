(*Extract a slice from a list. (medium)

Given two indices, i and k, the slice is the list containing the elements between the i'th and k'th element of the original list (both limits included). Start counting the elements with 0 (this is the way the List module numbers elements).
*)

let rec take n xs = match (n, xs) with
  | (_, []) | (0, _) -> []
  | (_, y::ys) -> y::(take (n-1) ys)

let rec skip n xs = match (n, xs) with
  | (_, []) | (0, _) -> xs
  | (_, y::ys) -> skip (n-1) ys

let slice xs from upto = skip from xs |> take (upto - from + 1)


let _ = assert ((slice ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 2 6) = ["c"; "d"; "e"; "f"; "g"])

