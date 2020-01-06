derive(U+V, X, DU + DV) :-
    derive(U, X, DU),
    derive(V, X, DV).

derive(U-V, X, DU - DV) :-
    derive(U, X, DU),
    derive(V, X, DV).


derive(U*V, X, DU*V+DV*U) :-
    derive(U, X, DU),
    derive(V, X, DV).

derive(U/V, X, (DU*V-DV*U)/V^2) :-
    derive(U, X, DU),
    derive(V, X, DV).

derive(U^P, X, P*U^(P-1)*DU) :-
    derive(U, X, DU).

derive(X,X,1).
derive(Y,X,0) :- 
    atomic(Y),
    Y \== X.

simplification(Exp, Res) :- 
    Exp =.. [_, A1, A2],
    number(A1),
    number(A2),
    Res is Exp.

simplification(Exp, Res) :-
    Exp =.. [Op, A1, A2],
    simplification(A1, Res1),
    simplification(A2, Res2),
    SExp =.. [Op, Res1, Res2],
    Exp \== SExp,
    simplification(SExp, Res).

simplification(0*_, 0).
simplification(_*0, 0).

simplification(0+E, E).
simplification(E+0, E).

simplification(1*E, E).
simplification(E*1, E).

simplification(E,E).

deriver(U, X, Res) :- 
    derive(U, X, Exp),
    simplification(Exp, Res).

