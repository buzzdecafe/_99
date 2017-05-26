(* A list of Goldbach compositions. (medium)
 *
 * Given a range of integers by its lower and upper limit, print a list 
 * of all even numbers and their Goldbach composition.
 *
 * In most cases, if an even number is written as the sum of two prime 
 * numbers, one of them is very small. Very rarely, the primes are both 
 * bigger than say 50. Try to find out how many such cases there are in 
 * the range 2..3000.
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
    | p::ps    -> try let x = List.find (sumsTo n p) (p::ps) in (x, p) 
                  with Not_found -> find_sum ps 
  in
  find_sum (all_primes 2 n)

let rec range acc low high = 
  if high < low then [] else
  if high = low then high::acc
  else range (high::acc) low (high-1)

let even x = x mod 2 = 0

let goldbach_list low high =
  range [] low high 
    |> List.filter even
    |> List.map (fun e -> (e, (goldbach e)))

let goldbach_limit low high lim = 
  let from = if low < 3 then 3 else low in
  goldbach_list from high
    |> List.filter (fun (_, (x, y)) -> x > 50 && y > 50)






let _ = assert ((goldbach_list 9 20) =
  [(10, (3, 7)); (12, (5, 7)); (14, (3, 11)); (16, (3, 13)); (18, (5, 13));
   (20, (3, 17))])
let _ = assert ((goldbach_limit 1 2000 50) =
  [(992, (73, 919)); (1382, (61, 1321)); (1856, (67, 1789));
   (1928, (61, 1867))])

