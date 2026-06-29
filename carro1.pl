/* carro */
carro(bmw_m5, luxo, 2022, alemanha, 600, gasolina, caro).
carro(mercedes_s_class, luxo, 2023, alemanha, 429, gasolina, caro).
carro(audi_a8, luxo, 2021, alemanha, 335, gasolina, caro).
carro(lexus_ls, luxo, 2020, japao, 416, hibrido, caro).
carro(bentley_continental, luxo, 2022, inglaterra, 626, gasolina, caro).

carro(audi_rs7, esportivo, 2021, alemanha, 591, gasolina, caro).
carro(bmw_m4, esportivo, 2022, alemanha, 503, gasolina, caro).
carro(ford_mustang, esportivo, 2008, eua, 450, gasolina, medio).
carro(nissan_gtr, esportivo, 2017, japao, 565, gasolina, caro).
carro(supra_mk4, esportivo, 1998, japao, 320, gasolina, medio).

carro(peugeot_208, economico, 2020, franca, 130, gasolina, medio).
carro(renault_clio, economico, 2016, franca, 120, diesel, barato).
carro(fiat_uno, economico, 2012, italia, 85, gasolina, barato).
carro(vw_gol, economico, 2005, alemanha, 95, gasolina, barato).

carro(toyota_corolla, familiar, 2018, japao, 140, gasolina, medio).
carro(honda_civic, familiar, 2021, japao, 158, gasolina, medio).
carro(vw_passat, familiar, 2017, alemanha, 174, gasolina, medio).

carro(toyota_rav4, suv, 2022, japao, 203, hibrido, caro).
carro(jeep_wrangler, suv, 2020, eua, 285, gasolina, caro).

carro(bmw_e30, classico, 1988, alemanha, 170, gasolina, medio).
carro(mercedes_190e, classico, 1986, alemanha, 160, gasolina, medio).
carro(porsche_944, classico, 1985, alemanha, 163, gasolina, caro).
carro(audi_quattro, classico, 1984, alemanha, 200, gasolina, caro).

carro(tesla_model_s, eletrico, 2022, eua, 1020, eletrico, caro).
carro(nissan_leaf, eletrico, 2019, japao, 150, eletrico, medio).
carro(byd_han, eletrico, 2021, china, 517, eletrico, medio).


/*  PERIODO (ANO) */

periodo(Ano, recente) :- Ano >= 2020.
periodo(Ano, medio)   :- Ano >= 2010, Ano < 2020.
periodo(Ano, antigo)  :- Ano >= 1980, Ano < 2010.


/* POTENCIA*/

desempenho(Potencia, extremo) :- Potencia >= 800.
desempenho(Potencia, alto)    :- Potencia >= 300, Potencia < 800.
desempenho(Potencia, normal)  :- Potencia < 300.


/*  PRECO (CALCULO INTELIGENTE) */

coef_tipo(luxo, 1.6).
coef_tipo(esportivo, 1.5).
coef_tipo(suv, 1.3).
coef_tipo(familiar, 1.1).
coef_tipo(economico, 0.9).
coef_tipo(classico, 1.2).
coef_tipo(eletrico, 1.4).


preco_estimado(Tipo, Ano, Potencia, Valor) :-
    coef_tipo(Tipo, C),
    Valor is (Ano * 10 + Potencia * 50) * C.


classifica_preco(Valor, barato) :-
    Valor < 30000.

classifica_preco(Valor, medio) :-
    Valor >= 30000,
    Valor < 70000.

classifica_preco(Valor, caro) :-
    Valor >= 70000.


/* =====================================================
   5. REGRA PRINCIPAL DE RECOMENDACAO
   ===================================================== */

recomenda_preco(Tipo, Periodo, Pais, Nivel, Combustivel, PrecoFinal, Nome) :-
    carro(Nome, Tipo, Ano, Pais, Potencia, Combustivel, _),
    periodo(Ano, Periodo),
    desempenho(Potencia, Nivel),
    preco_estimado(Tipo, Ano, Potencia, Valor),
    classifica_preco(Valor, PrecoFinal).
