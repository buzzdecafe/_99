(* Lotto: Draw N different random numbers from the set 1..M. (easy)

The selected numbers shall be returned in a list.
*)

let rec range m n = 
  if m = n then [n]
  else m::(range (m+1) n)

let choose1 xs = 
  let _ = Random.init(43799) in
  List.nth xs (Random.int (List.length xs))

let rec rm el = function
  | [] -> []
  | x::xs -> if x = el then xs else x::(rm el xs) 

let rec select acc xs = function
  | 0 -> acc
  | n -> let x = choose1 xs in
          select (x::acc) (rm x xs) (n-1)

let lotto_select n r = select [] (range 1 r) n  

let _ = assert ((lotto_select 6 49) = [47; 27; 39; 15; 35; 5])

