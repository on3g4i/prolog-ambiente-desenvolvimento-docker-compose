humano(sapiens).
humano(neandertales).
humano(erectus).
humano(habilis).
humano(australoptecos).
humano(antessesor).

descende(sapiens, neandertales).
descende(neandertales, erectus).
descende(erectus, habilis).
descende(habilis, australoptecos).
descende(australoptecos, antessesor).

descende_de(X,Y):- descende(X, Y).
descende_de(X,Y):- descende(X, Z) , descende_de(Z,Y). 

qtd_descendentes(X, Y, N):- descende(X, Y), N is 1.
qtd_descendentes(X, Y, N):- descende(X, Z), qtd_descendentes(Z, Y, N1), N is N1+1.

