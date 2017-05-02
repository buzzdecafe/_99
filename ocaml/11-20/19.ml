(* Rotate a list N places to the left. (medium) *)

let rec take n xs = match (n, xs) with
  | (_, []) | (0, _) -> []
  | (_, y::ys) -> y::(take (n-1) ys)

let rec skip n xs = match (n, xs) with
  | (_, []) | (0, _) -> xs
  | (_, y::ys) -> skip (n-1) ys

let rec rotate xs n =
  if n < 0 then rotate xs ((List.length xs) + n)
  else (skip n xs) @ (take n xs)


let _ = assert ((rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3) = ["d"; "e"; "f"; "g"; "h"; "a"; "b"; "c"])
let _ = assert ((rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] (-2)) = ["g"; "h"; "a"; "b"; "c"; "d"; "e"; "f"])

