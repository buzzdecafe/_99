(* Determine the greatest common divisor of two positive integer numbers. (medium)

Use Euclid's algorithm.
*)


let rec gcd a b = if b = 0 then a else gcd b (a mod b)

let _ = assert ((gcd 13 27) = 1)
let _ = assert ((gcd 20536 7826) = 2)

