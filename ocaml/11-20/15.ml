(* Replicate the elements of a list a given number of times. (medium) *)

let rec times n x = match n with
  | 0 -> []
  | _ -> x::(times (n-1) x)

let replicate xs n = List.map (times n) xs |> List.concat

let _ = assert ((replicate ["a";"b";"c"] 3) = ["a"; "a"; "a"; "b"; "b"; "b"; "c"; "c"; "c"])

