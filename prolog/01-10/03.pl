/*
P03 (*) Find the K'th element of a list.
    The first element in the list is number 1.
    Example:
    ?- element_at(X,[a,b,c,d,e],3).
    X = c
*/

element_at(X, [X|_], 1).
element_at(X, [_|T], N) :- N1 is N-1, element_at(X, T, N1).
