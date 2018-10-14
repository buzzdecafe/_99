/*
Modify the result of problem 1.10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as [N,E] terms.

Example:
?- encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[4,a],b,[2,c],[2,a],d,[4,e]]
*/

:- include('../01-10/10').

singles([], Acc, Encs) :- reverse(Acc, Encs).
singles([[X, 1] | T], Acc, Encs) :- singles(T, [X|Acc], Encs).
singles([[X, N] | T], Acc, Encs) :- N \= 1, singles(T, [[N, X]|Acc], Encs).

encode_modified([], []).
encode_modified(Xs, Encs) :-
  pack(Xs, Ys),
  encall(Ys, [], Zs),
  singles(Zs, [], Encs).
