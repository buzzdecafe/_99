(* Drop every N'th element from a list. (medium) *)

let dropi n x (i, ls) = if i mod n = 0 then (i+1, ls) else (i+1, x::ls)

let drop xs n = (List.fold_right (dropi n) xs (2, [])) |> snd

let _ = assert ((drop ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 3) = ["a"; "b"; "d"; "e"; "g"; "h"; "j"])

