(* Compare the two methods of calculating Euler's totient function. (easy)

Use the solutions of problems "Calculate Euler's totient function φ(m)" and 
"Calculate Euler's totient function φ(m) (improved)" to compare the 
algorithms. Take the number of logical inferences as a measure for efficiency. 
Try to calculate φ(10090) as an example.
*)

(* phi naive *)
let rec gcd a b = if b = 0 then a else gcd b (a mod b)

let coprime a b = (gcd a b) = 1

let phi n =
  let rec cmp = function
    | 1 -> 1
    | x -> if coprime x n then 1 + (cmp (x-1)) else cmp (x-1)
  in cmp n

(* phi improved *)
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


(* compare *)
let timeit n f x =
  let t = Sys.time() in
  let _ = f x in
  Printf.sprintf "%s %.20f" n (Sys.time() -. t)

let _ = timeit "phi" phi 10090
let _ = timeit "phi_improved" phi_improved 10090

