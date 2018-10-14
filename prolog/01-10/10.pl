/*
Use the result of problem 1.09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.

Example:
?- encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]]
*/

/* 09.pl */
:- include('09').

/* 10.pl */

enc([], Enc, Enc).
enc([H|T], [H, N], Enc) :- N1 is N + 1, enc(T, [H, N1], Enc).

enc([], []).
enc([H|T], Enc) :- enc(T, [H, 1], Enc).

encall([], Acc, Encs) :- reverse(Acc, Encs).
encall([H|T], Acc, Encs) :- enc(H, E), encall(T, [E|Acc], Encs).

encode(Xs, Encs) :- 
  pack(Xs, Ys),
  encall(Ys, [], Encs).
