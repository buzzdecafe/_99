/*
Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem 1.09, but only count them. As in problem 1.11, simplify the result list by replacing the singleton terms [1,X] by X.

Example:
?- encode_direct([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[4,a],b,[2,c],[2,a],d,[4,e]]
*/

singles([], Acc, Acc).
singles([[1, X] | T], Acc, Zs) :- singles(T, [X|Acc], Zs).
singles([[N, X] | T], Acc, Zs) :- 
  N \= 1,
  singles(T, [[N, X]| Acc], Zs).

encd([], Curr, Acc, Encs) :- singles([Curr|Acc], [], Encs).
encd([H|T], [], Acc, Encs) :- encd(T, [1, H], Acc, Encs).
encd([H|T], [N, H], Acc, Encs) :- 
  N1 is N + 1, 
  encd(T, [N1, H], Acc, Encs).
encd([H|T], [N, X], Acc, Encs) :- 
  X \= H,
  encd(T, [1, H], [[N, X] | Acc], Encs).


encode_direct([], []).
encode_direct([H|T], Encs) :- encd([H|T], [], [], Encs).
