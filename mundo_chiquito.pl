:- dynamic mostro/4.

% mostro(nombre, nivel, atributo, poder).
mostro(mostroUno, 5, luz, 2100).
mostro(mostroDos, 7, luz, 2400).
mostro(mostroTres, 7, viento, 2500).

compartenUnaCaracteristica(A1, A2, A3, B1, B2, B3):-
    A1 == B1,
    A2 \= B2,
    A3 \= B3.

ternaMundoChiquito(X, Y, Z):-
    mostro(X, NivelX, AtributoX, PoderX),
    mostro(Y, NivelY, AtributoY, PoderY),
    mostro(Z, NivelZ, AtributoZ, PoderZ),
    (
        (   % mostro X y Y SOLO comparten nivel, mostro Y y Z SOLO comparten nivel
            compartenUnaCaracteristica(NivelX, AtributoX, PoderX, NivelY, AtributoY, PoderY),  
            compartenUnaCaracteristica(NivelZ, AtributoZ, PoderZ, NivelY, AtributoY, PoderY)
        );
        (   % mostro X y Y SOLO comparten nivel, mostro Y y Z SOLO comparten atributo
            compartenUnaCaracteristica(NivelX, AtributoX, PoderX, NivelY, AtributoY, PoderY),  
            compartenUnaCaracteristica(AtributoZ, NivelZ, PoderZ, AtributoY, NivelY, PoderY)
        );
        (   % mostro X y Y SOLO comparten nivel, mostro Y y Z SOLO comparten poder
            compartenUnaCaracteristica(NivelX, AtributoX, PoderX, NivelY, AtributoY, PoderY),  
            compartenUnaCaracteristica(PoderZ, NivelZ, AtributoZ, PoderY, NivelY, AtributoY)
        );
        (   % mostro X y Y SOLO comparten atributo, mostro Y y Z SOLO comparten nivel
            compartenUnaCaracteristica(AtributoX, NivelX, PoderX, AtributoY, NivelY, PoderY),  
            compartenUnaCaracteristica(NivelZ, AtributoZ, PoderZ, NivelY, AtributoY, PoderY)
        );
        (   % mostro X y Y SOLO comparten atributo, mostro Y y Z SOLO comparten atributo
            compartenUnaCaracteristica(AtributoX, NivelX, PoderX, AtributoY, NivelY, PoderY),  
            compartenUnaCaracteristica(AtributoZ, NivelZ, PoderZ, AtributoY, NivelY, PoderY)
        );
        (   % mostro X y Y SOLO comparten atributo, mostro Y y Z SOLO comparten poder
            compartenUnaCaracteristica(AtributoX, NivelX, PoderX, AtributoY, NivelY, PoderY),  
            compartenUnaCaracteristica(PoderZ, NivelZ, AtributoZ, PoderY, NivelY, AtributoY)
        );
        (   % mostro X y Y SOLO comparten poder, mostro Y y Z SOLO comparten nivel
            compartenUnaCaracteristica(PoderX, AtributoX, NivelX, PoderY, AtributoY, NivelY),  
            compartenUnaCaracteristica(NivelZ, AtributoZ, PoderZ, NivelY, AtributoY, PoderY)
        );
        (   % mostro X y Y SOLO comparten poder, mostro Y y Z SOLO comparten atributo
            compartenUnaCaracteristica(PoderX, AtributoX, NivelX, PoderY, AtributoY, NivelY),  
            compartenUnaCaracteristica(AtributoZ, NivelZ, PoderZ, AtributoY, NivelY, PoderY)
        );
        (   % mostro X y Y SOLO comparten poder, mostro Y y Z SOLO comparten poder
            compartenUnaCaracteristica(PoderX, AtributoX, NivelX, PoderY, AtributoY, NivelY),  
            compartenUnaCaracteristica(PoderZ, NivelZ, AtributoZ, PoderY, NivelY, AtributoY)
        )
    ).

imprimirPorLinea([]).

imprimirPorLinea([[X, Y, Z] | Cola]):-
    format('~w ~w ~w~n', [X, Y, Z]),
    imprimirPorLinea(Cola).

mundoChiquito:-
    findall([X, Y, Z], ternaMundoChiquito(X, Y, Z), Terna),
    imprimirPorLinea(Terna).

agregarMostro:-
    format('Vamos a agregar un mostro!!~nUn mostro consiste de nombre, nivel, atributo y poder. Los agregaremos uno por uno~nIngresa el nombre del mostro (inicia con minuscula, termina con un punto): '),
    read(Nombre),
    mostro(M,_,_,_),
    (
        ( % nombre repetido

            M == Nombre,
            write('Error: Ya hay un mostro con ese nombre x.x')
        );
        ( % nombre valido

            write('Ingresa el nivel del mostro (debe ser un entero, termina con un punto): '),
            read(Nivel),
            (
                ( % nivel invalido

                    (
                        not(integer(Nivel));    % nivel no es entero
                        (                       % nivel no cumple con el rango
                            Nivel < 1;
                            Nivel > 12
                        )
                    ),
                    write('Error: El nivel debe ser un numero entero entre 1 y 12 x.x')
                );
                ( % nivel valido

                    write('Ingresa el atributo del mostro (inicia con minuscula, termina con un punto): '),
                    read(Atributo),
                    (
                        (   % atributo invalido

                            Atributo \= agua,
                            Atributo \= fuego,
                            Atributo \= viento,
                            Atributo \= tierra,
                            Atributo \= luz,
                            Atributo \= oscuridad,
                            Atributo \= divino,
                            write('Error: El atributo debe ser "agua", "fuego", "viento", "tierra", "luz", "oscuridad" o "divino" x.x')
                        );
                        (   % atributo valido

                            write('Ingresa el poder del mostro (debe ser multiplo de 50, termina con un punto): '),
                            read(Poder),
                            (
                                (   % poder invalido

                                    (
                                        not(integer(Poder));    % poder no es entero
                                        (                       % poder no es multiplo de 50
                                            P is Poder mod 50,
                                            P \= 0
                                        )
                                    ),
                                    write('Error: El poder debe ser un entero multiplo de 50 x.x')
                                );
                                (   % poder valido

                                    format('~nGeniail!!, agregaste el mostro "~w" de nivel "~w" con atributo "~w" y poder "~w"~n~n', [Nombre, Nivel, Atributo, Poder]),
                                    write('Estas seguro de los datos suministrados? Responde con si o no (en minusculas y termina con punto): '),
                                    read(Seguro),
                                    (
                                        (   % se agrega el mostro nuevo

                                            Seguro == 'si',
                                            asserta(mostro(Nombre, Nivel, Atributo, Poder)),
                                            write("Mostro agregado exitosamente :)")
                                        );
                                        (   % no se agrega el mostro nuevo

                                            Seguro == 'no',
                                            write("No se agrego el mostro :(")
                                        );
                                        (   % opcion invalida
                                        
                                            Seguro \= 'si',
                                            Seguro \= 'no',
                                            write("Esa no fue una opcion valida -.-")
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    ).
    