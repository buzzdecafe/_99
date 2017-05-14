(* Determine whether a given integer number is prime. (medium) *)

let sqrti n = float_of_int n |> sqrt |> int_of_float

let rec test d n = 
  if d > sqrti n then true
  else if n mod d = 0 then false
  else test (d+2) n 

let is_prime = function
  | 1 -> false
  | 2 -> true
  | n -> if n mod 2 = 0 then false else test 3 n

let _ = assert (not(is_prime 1))
let _ = assert (is_prime 7)
let _ = assert (not (is_prime 12))

