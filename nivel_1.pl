homem(aholou).
homem(grand-pere).
homem(grnd-pere).
homem(espoir).
homem(ernest).
homem(alfred).
homem(stephane).

mulher(charlotte).
mulher(carmelle).
mulher(marie).
mulher(blandine).
mulher(grand-mere).
mulher(grnd-mere).

gerou(grand-pere, aholou).
gerou(grand-mere, aholou).
gerou(grnd-pere, blandine).
gerou(grnd-mere, blandine).
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


filhos_homens(aholou, Y):- gerou(aholou, Y) , homem(Y).
filhas_mulheres(blandine, Y):- gerou(blandine, Y) , mulher(Y).

