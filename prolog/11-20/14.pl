/*
Duplicate the elements of a list.
    Example:
    ?- dupli([a,b,c,c,d],X).
    X = [a,a,b,b,c,c,c,c,d,d]
*/

dupli([], Acc, Ys) :- reverse(Acc, Ys).
dupli([H|T], Acc, Ys) :- dupli(T, [H, H|Acc], Ys).

dupli([], []).
dupli(Xs, Ys) :- dupli(Xs, [], Ys).
