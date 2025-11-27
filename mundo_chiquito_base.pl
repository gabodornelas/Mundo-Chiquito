:- dynamic mostro/4.

% mostro(nombre, nivel, atributo, poder).
mostro(mostroUno, 5, luz, 2100).
mostro(mostroDos, 7, luz, 2400).
mostro(mostroTres, 7, viento, 2500).

compartenUnAtributo(A1, A2, A3, B1, B2, B3):-
    A1 == B1,
    A2 \= B2,
    A3 \= B3.

ternaMundoChiquito(X, Y, Z):-
    mostro(X, NivelX, AtributoX, PoderX),
    mostro(Y, NivelY, AtributoY, PoderY),
    mostro(Z, NivelZ, AtributoZ, PoderZ),
    (
        (   % mostro X y Y SOLO comparten nivel, mostro Y y Z SOLO comparten nivel
            compartenUnAtributo(NivelX, AtributoX, PoderX, NivelY, AtributoY, PoderY),  
            compartenUnAtributo(NivelZ, AtributoZ, PoderZ, NivelY, AtributoY, PoderY)
        );
        (   % mostro X y Y SOLO comparten nivel, mostro Y y Z SOLO comparten atributo
            compartenUnAtributo(NivelX, AtributoX, PoderX, NivelY, AtributoY, PoderY),  
            compartenUnAtributo(AtributoZ, NivelZ, PoderZ, AtributoY, NivelY, PoderY)
        );
        (   % mostro X y Y SOLO comparten nivel, mostro Y y Z SOLO comparten poder
            compartenUnAtributo(NivelX, AtributoX, PoderX, NivelY, AtributoY, PoderY),  
            compartenUnAtributo(PoderZ, NivelZ, AtributoZ, PoderY, NivelY, AtributoY)
        );
        (   % mostro X y Y SOLO comparten atributo, mostro Y y Z SOLO comparten nivel
            compartenUnAtributo(AtributoX, NivelX, PoderX, AtributoY, NivelY, PoderY),  
            compartenUnAtributo(NivelZ, AtributoZ, PoderZ, NivelY, AtributoY, PoderY)
        );
        (   % mostro X y Y SOLO comparten atributo, mostro Y y Z SOLO comparten atributo
            compartenUnAtributo(AtributoX, NivelX, PoderX, AtributoY, NivelY, PoderY),  
            compartenUnAtributo(AtributoZ, NivelZ, PoderZ, AtributoY, NivelY, PoderY)
        );
        (   % mostro X y Y SOLO comparten atributo, mostro Y y Z SOLO comparten poder
            compartenUnAtributo(AtributoX, NivelX, PoderX, AtributoY, NivelY, PoderY),  
            compartenUnAtributo(PoderZ, NivelZ, AtributoZ, PoderY, NivelY, AtributoY)
        );
        (   % mostro X y Y SOLO comparten poder, mostro Y y Z SOLO comparten nivel
            compartenUnAtributo(PoderX, AtributoX, NivelX, PoderY, AtributoY, NivelY),  
            compartenUnAtributo(NivelZ, AtributoZ, PoderZ, NivelY, AtributoY, PoderY)
        );
        (   % mostro X y Y SOLO comparten poder, mostro Y y Z SOLO comparten atributo
            compartenUnAtributo(PoderX, AtributoX, NivelX, PoderY, AtributoY, NivelY),  
            compartenUnAtributo(AtributoZ, NivelZ, PoderZ, AtributoY, NivelY, PoderY)
        );
        (   % mostro X y Y SOLO comparten poder, mostro Y y Z SOLO comparten poder
            compartenUnAtributo(PoderX, AtributoX, NivelX, PoderY, AtributoY, NivelY),  
            compartenUnAtributo(PoderZ, NivelZ, AtributoZ, PoderY, NivelY, AtributoY)
        )
    ).

% mundoChiquito :- ...

% agregarMostro :- ...