fusion(List,[],List).
fusion([],List,List).
fusion([P1 |L1], [P2 | L2], [P1 |L3]) :-
    P1 < P2,
    fusion(L1, [P2 | L2], L3).

fusion([P1 |L1], [P2 | L2], [P2 |L3]) :-
    P2 =< P1,
    fusion([P1 | L1], L2, L3).