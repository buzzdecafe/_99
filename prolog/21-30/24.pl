/*
Lotto: Draw N different random numbers from the set 1..M.
    The selected numbers shall be put into a result list.
    Example:
    ?- lotto(6,49,L).
    L = [23,1,17,33,21,37]
*/

:- include('22').
:- include('23').

lotto(0, _, []).
lotto(B, N, L) :- 
  B > 0,
  range(1, N, Rs),
  rnd_select(Rs, B, L).

