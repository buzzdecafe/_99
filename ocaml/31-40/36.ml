(*A list of prime numbers. (easy)
 *
 * Given a range of integers by its lower and upper limit, construct a list of all prime numbers in that range.
 *)

let sqrti n = float_of_int n |> sqrt |> int_of_float

let rec test d n = 
  if d > sqrti n then true
  else if n mod d = 0 then false
  else test (d+2) n 

let is_prime = function
  | 1 -> false
  | 2 -> true
  | n -> if n mod 2 = 0 then false else test 3 n

let rec all_primes from upto = 
  let rec f acc frm =
    if frm = upto then acc
    else if is_prime frm then f (frm::acc) (frm+1) else f acc (frm+1)
  in
  f [] from


let _ = assert ((List.length (all_primes 2 7920)) = 1000)
