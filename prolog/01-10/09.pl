/*
P09 (**) Pack consecutive duplicates of list elements into sublists.
    If a list contains repeated elements they should be placed in separate sublists.

    Example:
    ?- pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
    X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]
*/

pacc([], Ys, Acc) :- reverse(Acc, Ys).
pacc([H|T], Ys, [[H|Hs]|Acc]) :- pacc(T, Ys, [[H, H |Hs]|Acc]).
pacc([H|T], Ys, Acc) :- pacc(T, Ys, [[H]|Acc]).
pacc([H, G | T], Ys, Acc) :- 
  H \= G, 
  pacc([G|T], Ys, [[H]|Acc]).

pack(Xs, Ys) :- once(pacc(Xs, Ys, [])).
