/*
P02 (*) Find the last but one element of a list.
    (zweitletztes Element, l'avant-dernier élément)
*/

penult(_, []) :- fail.
penult(_, [_]) :- fail.
penult(X, [X, _]).
penult(X, [_|T]) :- penult(X, T).
