(* Determine whether two positive integer numbers are coprime. (easy)

Two numbers are coprime if their greatest common divisor equals 1.
*)

let rec gcd a b = if b = 0 then a else gcd b (a mod b)

let coprime a b = (gcd a b) = 1

let _ = assert ((coprime 13 27) = true)
let _ = assert ((not (coprime 20536 7826)) = true)

