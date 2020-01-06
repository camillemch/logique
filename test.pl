
detruire(Elem,[],[]).

detruire(Elem,[Elem|Reste],Res) :- 
    detruire(Elem,Reste,Res).

detruire(Elem,[Prem|Reste],[Prem|Res]) :- 
    Elem\== Prem,
    detruire(Elem,Reste,Res).