:-use_module(library(clpfd)).

somme([],0).
somme([Debut | Fin],Somme) :- 
    somme(Fin, S),
    Somme #= Debut + S.
