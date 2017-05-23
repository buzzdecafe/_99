(*
Determine the prime factors of a given positive integer. (medium)

Construct a flat list containing the prime factors in ascending order.
*)
  
let factors n = 
  let rec getFsOf x acc t =
    if t = x then t::acc
    else if x mod t = 0 then getFsOf (x/t) (t::acc) t 
    else getFsOf x acc (t+1)
  in getFsOf n [] 2 |> List.rev

let _ = assert ((factors 315) = [3; 3; 5; 7])

