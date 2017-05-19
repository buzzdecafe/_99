(* Calculate Euler's totient function φ(m). (medium)
 *
 * Euler's so-called totient function φ(m) is defined as the number of positive integers r (1 ≤ r < m) that are coprime to m. We let φ(1) = 1.
 *
 * Find out what the value of φ(m) is if m is a prime number. Euler's totient function plays an important role in one of the most widely used public key cryptography methods (RSA). In this exercise you should use the most primitive method to calculate this function (there are smarter ways that we shall discuss later).
 *)
let rec gcd a b = if b = 0 then a else gcd b (a mod b)

let coprime a b = (gcd a b) = 1

let phi n =
  let rec cmp = function
    | 1 -> 1
    | x -> if coprime x n then 1 + (cmp (x-1)) else cmp (x-1)
  in cmp n

let _ = assert ((phi 10) = 4)
let _ = assert ((phi 13) = 12)

