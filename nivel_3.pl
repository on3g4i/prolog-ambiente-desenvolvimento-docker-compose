carro(bmw_m5, luxo, 2022, 600).
carro(mercedes_s_class, luxo, 2023, 429).
carro(audi_a8, luxo, 2021, 335).
carro(lexus_ls, luxo, 2020, 416).
carro(bentley_continental, luxo, 2022, 626).
carro(rolls_royce_ghost, luxo, 2021, 563).
carro(porsche_panamera, luxo, 2020, 550).
carro(bmw_7_series, luxo, 2019, 445).
carro(mercedes_maybach_s, luxo, 2022, 621).
carro(audi_s8, luxo, 2021, 563).
carro(jaguar_xj, luxo, 2018, 340).
carro(genesis_g90, luxo, 2021, 365).

carro(audi_rs7, esportivo, 2021, 591).
carro(bmw_m4, esportivo, 2022, 503).
carro(ford_mustang, esportivo, 2008, 450).
carro(nissan_gtr, esportivo, 2017, 565).
carro(lamborghini_huracan, esportivo, 2022, 640).
carro(ferrari_f8, esportivo, 2021, 710).
carro(porsche_911, esportivo, 2021, 450).
carro(chevrolet_camaro, esportivo, 2019, 455).
carro(toyota_supra_mk5, esportivo, 2020, 382).
carro(bmw_m2, esportivo, 2021, 453).
carro(audi_r8, esportivo, 2020, 562).
carro(ford_gt, esportivo, 2018, 647).

carro(peugeot_208, economico, 2020, 130).
carro(renault_clio, economico, 2016, 120).
carro(fiat_uno, economico, 2012, 85).
carro(vw_gol, economico, 2005, 95).
carro(toyota_yaris, economico, 2019, 110).
carro(hyundai_i10, economico, 2018, 67).
carro(dacia_sandero, economico, 2017, 90).
carro(kia_picanto, economico, 2020, 67).
carro(suzuki_celerio, economico, 2019, 68).
carro(chevrolet_onix, economico, 2021, 116).
carro(fiat_mobi, economico, 2022, 74).
carro(vw_polo, economico, 2018, 110).

carro(tesla_model_s, eletrico, 2022, 1020).
carro(tesla_model_3, eletrico, 2021, 480).
carro(nissan_leaf, eletrico, 2019, 150).
carro(byd_han, eletrico, 2021, 517).
carro(porsche_taycan, eletrico, 2022, 761).
carro(bmw_i4, eletrico, 2022, 536).
carro(audi_e_tron_gt, eletrico, 2021, 637).
carro(mercedes_eqs, eletrico, 2022, 516).
carro(hyundai_kona_ev, eletrico, 2020, 204).
carro(kia_ev6, eletrico, 2022, 576).
carro(volkswagen_id4, eletrico, 2021, 201).
carro(ford_mustang_mach_e, eletrico, 2021, 480).

periodo(Ano, recente) :- Ano >= 2020, !.
periodo(Ano, medio)   :- Ano >= 2010, !.
periodo(_, antigo).

desempenho(P, extremo) :- P >= 800, !.
desempenho(P, alto)    :- P >= 300, !.
desempenho(_, normal).

coef_tipo(luxo, 2).
coef_tipo(esportivo, 2).
coef_tipo(eletrico, 2).
coef_tipo(economico, 1).

preco_estimado(Tipo, Ano, Potencia, Valor) :-
    coef_tipo(Tipo, C),
    Valor is ((Ano + Potencia) * C) * 10.

classifica_preco(V, barato) :- V < 3000, !.
classifica_preco(V, medio)  :- V < 7000, !.
classifica_preco(_, caro).

recomenda(Nome, Tipo, Ano, Potencia, Periodo, Nivel, Valor, Preco) :-
    carro(Nome, Tipo, Ano, Potencia),
    periodo(Ano, Periodo),
    desempenho(Potencia, Nivel),
    preco_estimado(Tipo, Ano, Potencia, Valor),
    classifica_preco(Valor, Preco).


inicio :-
    write(' SISTEMA ESPECIALISTA '), nl,

    write('Tipo de carro: '), read(Tipo),
    write('Nivel (normal/alto/extremo): '), read(Nivel),
    write('Preco (barato/medio/caro): '), read(Preco),

    recomenda(Nome, Tipo, Ano, Potencia, Periodo, Nivel, Valor, Preco),

    nl,
    write(' RESULTADO '), nl,
    write('Carro: '), write(Nome), nl,
    write('Ano: '), write(Ano), nl,
    write('Potencia: '), write(Potencia), nl,
    write('Valor estimado: '), write(Valor), write('$'), nl,
    write('Periodo: '), write(Periodo), nl.
