/*
P05 (*) Reverse a list.
*/
revacc([], Ys, Ys).
revacc([H|T], Ys, Acc) :- revacc(T, Ys, [H|Acc]).

rev([], []).
rev(Xs, Ys) :- revacc(Xs, Ys, []). 
