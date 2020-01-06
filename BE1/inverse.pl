inverse(L1, L2) :- inverse(L1, [], L2).
inverse([], Etsil, Etsil).
inverse([P|List], List2, Etsil) :-
    inverse(List, [P | List2], Etsil).

inverse1([],[]) .
inverse1([P |L1],L2) :- 
    inverse1(L1, L3),
    append(L3, [P], L2).