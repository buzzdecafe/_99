(* Generate the combinations of K distinct objects chosen from the N elements of a list. (medium)
 *
 * In how many ways can a committee of 3 be chosen from a group of 12 people? We all know that there are C(12,3) = 220 possibilities (C(N,K) denotes the well-known binomial coefficients). For pure mathematicians, this result may be great. But we want to really generate all the possibilities in a list.
 *)


let rec extract k ls =
  if k = 0 then [[]]
  else 
    let rec collect = function
      | [] -> []
      | x::xs -> List.map (fun y -> x::y) (extract (k-1) xs)::(collect xs)
    in
      collect ls |> List.concat

let _ = assert (
  List.sort Pervasives.compare (extract 2 ["a";"b";"c";"d"]) = 
  List.sort Pervasives.compare [["c"; "d"]; ["b"; "d"]; ["b"; "c"]; ["a"; "d"]; ["a"; "c"]; ["a"; "b"]])


