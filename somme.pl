somme([],0).
somme([Debut | Fin],Somme) :- 
    somme(Fin, S),
    Somme is Debut + S .
