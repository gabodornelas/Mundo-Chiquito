# Proyecto 2: Mundo Chiquito (CI-3661)

**Integrantes:**  
- Gabriel De Ornelas — *15-10377*  
- Blanyer Vielma — *16-11238*  

---

## Implementacion

### ternaMundoChiquito(X,Y,Z)
- Termino compuesto que unifica las variables X, Y, Z con nombres de mostros, y NivelX, AtributoX, PoderX, NivelY, AtributoY, PoderY, NivelZ, AtributoZ, PoderZ, con el nivel, atributo y poder de cada mostro respectivamente.
- Se apoya en el termino compuesto compartenUnaCaracteristica para verificar que entre el mostro X y Y comparten solo una caracteristica y entre el mostro Y y Z comparten solo una caracteristica.

### compartenUnaCaracteristica(A1, A2, A3, B1, B2, B3)
- Termino compuesto que verifica si las variables A1 es igual a B1, A2 es distinto de B2 y A3 es distinto de B3.
- Siendo A1, A2, A3, B1, B2 y B3 caracteristicas de los mostros, las As son caracteristicas de un mostro las Bs, de otro.

### mundoChiquito()
- Termino compuesto que invoca findall para encontrar todas las ternas que puede producir ternaMundoChiquito y las guarda en la lista Terna.
- Luego invoca imprimirPorLinea para imprimir las ternas en Terna.

### imprimirPorLinea([[X, Y, Z] | Cola])
- Termino compuesto que imprime por linea la lista de ternas encontradas en ternaMundoChiquito con caso base y caso recursivo.
- El caso base es para listas vacias.
- El caso recursivo toma la cabeza de la lista con los mostros X, Y y Z, los imprime en el formato y se invoca recusrivamente con la Cola de la lista.

### agregarMostro
- Termino compuesto que solicita al usuario (con read y format) los datos para un nuevo mostro, los va verificando mientras son ingresados bajo ciertas condiciones, da un mensaje de error cuando alguna condicion no se cumple, y da un mensaje donde el usuario verifica los datos del monstruo y luego de la verificaion lo agrega al inicio de la base de conocimientos (con asserta).
- Las condiciones son:
    - el nombre es único
    - el nivel es un número entero entre 1 y 12
    - el poder es un número entero múltiplo de 50
    - el atributo puede ser cualquiera entre agua, fuego, viento, tierra, luz, oscuridad o divino

### nombreRepetido
- Termino compuesto que revisa si el nombre del nuevo mostro esta repetido, para ello invoca findall para tener la lista Mostros con los nombres de todos los mostros.
- El caso base es para listas vacias, ya sea porque no hay mostros en la base de conocimientos o porque la recursion llego al final de la lista. Devolveria false.
- El caso donde la cabeza de la lista coincide con el nombre buscado termina la busqueda y devolveria true.
- El caso recursivo se invoca a si misma para revisar si el nombre esta en la Cola de la lista.
