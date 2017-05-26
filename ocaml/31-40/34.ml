(* Calculate Euler's totient function φ(m) (improved). (medium)

See problem "Calculate Euler's totient function φ(m)" for the 
definition of Euler's totient function. If the list of the prime 
factors of a number m is known in the form of the previous problem 
then the function phi(m) can be efficiently calculated as follows: 
  Let [(p1, m1); (p2, m2); (p3, m3); ...] be the list of prime 
  factors (and their multiplicities) of a given number m. Then 
  φ(m) can be calculated with the following formula:

  φ(m) = (p1 - 1) × p1m1 - 1 × (p2 - 1) × p2m2 - 1 × (p3 - 1) × p3m3 - 1 × ⋯
*)


let factors n = 
  let rec getFsOf x acc t =
    if t = x then t::acc
    else if x mod t = 0 then getFsOf (x/t) (t::acc) t 
    else getFsOf x acc (t+1)
  in getFsOf n [] 2

let toTuples = List.fold_left 
  (fun ts n ->
    match ts with
    | []         -> [(n, 1)]
    | (x, c)::xs -> if n = x then (x, c+1)::xs else (n, 1)::(x, c)::xs
  ) 
  []

let pow base exp = float_of_int base ** float_of_int exp |> int_of_float

let phi_improved n = 
  factors n 
    |> toTuples 
    |> List.fold_left (fun acc (p, m) -> acc * (p-1) * (pow p (m-1))) 1


let _ = assert ((phi_improved 10) = 4)
let _ = assert ((phi_improved 13) = 12)
