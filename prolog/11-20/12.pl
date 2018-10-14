/*
Given a run-length code list generated as specified in problem 1.11. Construct its uncompressed version.

decode([[4,a],b,[2,c],[2,a],d,[4,e]], Xs).
Xs = [a, a, a, a, b, c c, a, a, d, e, e, e, e].
*/

dec(_, 0, Acc, Acc).
dec(A, N, Acc, Xs) :- N > 0, N1 is N - 1, dec(A, N1, [A|Acc], Xs).

decode([], Acc, Decs) :- reverse(Acc, Xs), flatten(Xs, Decs).
decode([[N|H] | T], Acc, Decs) :- 
  dec(H, N, [], As),
  decode(T, [As|Acc], Decs).
decode([A|T], Acc, Decs) :- 
  not(is_list(A)),
  decode(T, [[A]|Acc], Decs).

decode(Xs, Decs) :- once(decode(Xs, [], Decs)). 

