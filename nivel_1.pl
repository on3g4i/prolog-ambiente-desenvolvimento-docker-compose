homem(grand-pere1).
homem(grand-pere2).
homem(aholou).
homem(espoir).
homem(ernest).
homem(alfred).
homem(stephane).

mulher(grand-mere1).
mulher(grand-mere2).
mulher(charlotte).
mulher(carmelle).
mulher(marie).
mulher(blandine).

irma_espoir(charlotte).
irma_espoir(carmelle).
irma_espoir(marie).

irmao_espoir(alfred).
irmao_espoir(ernest).
irmao_espoir(stephane).

gerou(grand-pere1, aholou).
gerou(grand-mere1, aholou).
gerou(grand-pere2, blandine).
gerou(grand-mere2, blandine).
gerou(aholou, charlotte).
gerou(aholou, carmelle).
gerou(aholou, marie).
gerou(aholou, espoir).
gerou(aholou, ernest).
gerou(aholou, alfred).
gerou(aholou, stephane).
gerou(blandine, charlotte).
gerou(blandine, carmelle).
gerou(blandine, espoir).
gerou(blandine, ernest).
gerou(blandine, alfred).
gerou(blandine, stephane).


filhos_homens(P, M, X):- ((homem(P), gerou(P, X)); (mulher(M), gerou(M, X))) , homem(X).
filhas_mulheres(P, M, X):- ((homem(P), gerou(P, X)); (mulher(M), gerou(M, X))) , mulher(X).
irmas_espoir(X, espoir):- (gerou(aholou, X); gerou(blandine, X)), irma_espoir(X).
irmaos_espoir(X, espoir):- (gerou(aholou, X); gerou(blandine, X)), irmao_espoir(X).
