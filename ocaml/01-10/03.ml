(* Find the k'th element of a list. (easy) *)

(* at : int -> 'a list -> 'a option *)
let rec at n = function
  | [] -> None
  | x::xs -> if n = 1 then Some x else at (n - 1) xs

let _ = assert ((at 3 [ "a" ; "b"; "c"; "d"; "e" ]) = Some "c")
let _ = assert ((at 3 [ "a" ]) = None)

