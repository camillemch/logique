chemin(X,Y) :- relies(X,Y).
chemin(X,Y) :- relies(X,Z), chemin(Z,Y).
relies(l,n).
relies(p,l).