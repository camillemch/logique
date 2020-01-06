:-use_module(library(clpfd)).

tache(a, 7, []).
tache(b, 3, [a]).
tache(c, 1, [b]).
tache(d, 8, [a]).
tache(e, 2, [d,c]).
tache(f, 1, [d,c]).
tache(g, 1, [d,c]).
tache(h, 3, [f]).
tache(j, 2, [h]).
tache(k, 1, [e,g,j]).
tache(fin, 0, [a,b,c,d,e,f,g,h,j,k]).

ordo(LT) :-
    findall([Nom, _], tache(Nom, _, _),LT),
    contraindre(LT,LT),
    transpose(LT, [Nom, Dates]),
    Dates ins 1..30,
    member([fin, DebFin], LT),
    labeling([], [DebFin]),
    affiche(LT).

contraindre([], _).

contraindre([[PT, DPT] | Reste], LT) :-
    tache(PT, _, ListePrecedent),
    contraindrePrecedent(DPT, ListePrecedent, LT),
    contraindre(Reste, LT).

contraindrePrecedent(_, [], _).

contraindrePrecedent(DPT, [Premier | Suivant], LT) :-
    member([Premier, Debut], LT),
    tache(Premier, Duree, _),
    DPT #>= Debut + Duree,
    contraindrePrecedent(DPT, Suivant, LT).

affiche([]).
affiche([[Nom,Date] |Reste]) :-
    writef('%w -> %w\n', [Nom, Date]),
    affiche(Reste).