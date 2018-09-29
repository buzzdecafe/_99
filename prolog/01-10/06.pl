/*
P06 (*) Find out whether a list is a palindrome.
    A palindrome can be read forward or backward; e.g. [x,a,m,a,x].
*/
revacc([], Ys, Ys).
revacc([H|T], Ys, Acc) :- revacc(T, Ys, [H|Acc]).

rev([], []).
rev(Xs, Ys) :- revacc(Xs, Ys, []). 

palindrome([]).
palindrome(Xs) :- rev(Xs, Rs), Rs = Xs.
