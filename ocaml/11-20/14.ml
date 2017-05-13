(* Duplicate the elements of a list. (easy) *)



let rec duplicate = function
  | [] -> []
  | x::xs -> x::x::(duplicate xs)


let _ = assert (
  (duplicate ["a";"b";"c";"c";"d"]) =
  ["a"; "a"; "b"; "b"; "c"; "c"; "c"; "c"; "d"; "d"])

