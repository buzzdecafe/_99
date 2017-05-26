(* Goldbach's conjecture. (medium)

Goldbach's conjecture says that every positive even number greater 
than 2 is the sum of two prime numbers. Example: 28 = 5 + 23. It is 
one of the most famous facts in number theory that has not been 
proved to be correct in the general case. It has been numerically 
confirmed up to very large numbers. Write a function to find the 
two prime numbers that sum up to a given even integer.
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




let goldbach n = 
  let sumsTo n a b = n = a + b in
  let rec find_sum = function
    | []       -> raise Not_found
    | [p]      -> if sumsTo n p p then (p, p) else raise Not_found
    | p::ps    -> try let x = List.find (sumsTo n p) (p::ps) in (p, x) 
                  with Not_found -> find_sum ps 
  in
  find_sum (all_primes 2 n)


let _ = assert (let (a, b) = goldbach 28 in a + b = 28)

