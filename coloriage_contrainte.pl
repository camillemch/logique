:-use_module(library(clpfd)).

colorie :-
    tous_les_pays(Liste),
    colorie(Liste).

colorie(Liste) :-
    findall([V,_],member(V,Liste),L),
    bagof(G, D^member([D,G],L), Al), 
    Al ins 1..6,
    contraindre(L),
    labeling([], Al),
    affiche(L).

contraindre([]).

contraindre([[PremPays, PremCoul]| Reste]) :-
    contraindreVoisin(PremPays, PremCoul, Reste),
    contraindre(Reste).

contraindreVoisin(_, _, []).

contraindreVoisin(PremPays, PremCoul, [[Pays, Coul] | Reste]) :-
    voisins(PremPays, Pays),
    PremCoul #\= Coul,
    contraindreVoisin(PremPays, PremCoul, Reste).

contraindreVoisin(PremPays, PremCoul, [[Pays, _] | Reste]) :-
    not(voisins(PremPays, Pays)),
    contraindreVoisin(PremPays, PremCoul, Reste).

tous_les_pays(L) :- 
    setof(Pays, Autre^voisins(Pays, Autre), L).

affiche([]).
affiche([[Pays,CouleurIndex] |Reste]) :-
    Couleurs = [bleu, rouge, vert, blanc, jaune],
    nth1(CouleurIndex, Couleurs, Couleur),
    writef('%w -> %w\n', [Pays, Couleur]),
    affiche(Reste).

voisins(X,Y) :- voisin(X,Y).
voisins(X,Y) :- voisin(Y,X).
