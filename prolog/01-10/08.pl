/*
P08 (**) Eliminate consecutive duplicates of list elements.
    If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

    Example:
    ?- compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
    X = [a,b,c,a,d,e]
*/

compacc([], Ys, Acc) :- reverse(Acc, Ys).
compacc([X], Ys, Acc) :- compacc([], Ys, [X|Acc]).
compacc([H, H | T], Ys, Acc) :- compacc([H|T], Ys, Acc).
compacc([H, G | T], Ys, Acc) :- 
  H \= G, 
  compacc([G|T], Ys, [H|Acc]).

compress(Xs, Ys) :- once(compacc(Xs, Ys, [])).
