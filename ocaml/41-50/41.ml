(* Gray code. (medium)
 *
 * An n-bit Gray code is a sequence of n-bit strings constructed 
 * according to certain rules. Find out the construction rules and 
 * write a function with the following specification: gray n returns 
 * the n-bit Gray code.
 *)

let prefix s b = s ^ b

let rec gray = function
  | 0 -> []
  | 1 -> ["0"; "1"]
  | n -> List.map (prefix "0") (gray (n-1)) @ List.map (prefix "1") (List.rev (gray (n-1)))

let _ = assert ((gray 1) = ["0"; "1"])
let _ = assert ((gray 2) = ["00"; "01"; "11"; "10"])
let _ = assert ((gray 3) = ["000"; "001"; "011"; "010"; "110"; "111"; "101"; "100"])

