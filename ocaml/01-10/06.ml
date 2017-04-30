(* Find out whether a list is a palindrome. (easy) *)

(* rev : 'a list -> 'a list *)
let rec rev = function
  | [] -> []
  | x::xs -> (rev xs) @ [x]

(* is_palindrome : 'a list -> bool *)
let is_palindrome xs = rev xs = xs

let _ = assert (is_palindrome [ "x" ; "a" ; "m" ; "a" ; "x" ])
let _ = assert ( not (is_palindrome [ "a" ; "b" ]))

