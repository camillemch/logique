colorie :-
    tous_les_pays(Liste),
    colorie(Liste).

colorie(Liste) :-
    colorie(Liste, Resultat),
    affiche(Resultat).

colorie(Liste, Resultat) :-
    colorie(Liste, [], Resultat).

colorie([], Precedents, Precedents).

colorie([Prem|Reste], Precedents, Resultat) :-
    couleur(Coul),
    not(incompatible(Prem, Coul, Precedents)),
    colorie(Reste, [[Prem, Coul]|Precedents], Resultat).

incompatible(Pays, Couleur, [[Voisin, Couleur]|_]) :-
    voisins(Pays, Voisin).
incompatible(Pays, Couleur, [_|Reste]) :-
    incompatible(Pays, Couleur, Reste).

tous_les_pays(L) :- 
    setof(Pays, Autre^voisins(Pays, Autre), L).

affiche([]).
affiche([[Pays,Couleur] |Reste]) :-
    writef('%w -> %w\n', [Pays, Couleur]),
    affiche(Reste).

voisins(X,Y) :- voisin(X,Y).
voisins(X,Y) :- voisin(Y,X).

couleur(bleu).
couleur(rouge).
couleur(vert).