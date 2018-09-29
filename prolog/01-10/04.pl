/*
P04 (*) Find the number of elements of a list.
*/

cacc([], Acc, Z) :- Z = Acc.
cacc([_|T], Acc, Z) :- Acc1 is Acc + 1, cacc(T, Acc1, Z).

count([], 0).
count(Xs, N) :- cacc(Xs, 0, N).
