:- op(800, fx, if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(500, xfy, and).
:- op(800, xfx, <=).
:-dynamic(fact/1).
:- [basedados, forward, certainty, proof, baseconhecimento].


menu:- retractall(fact(_)), nl,
	write('Bem Vindo ao programa de ajuda m�dico!'), nl,
	write('Iremos colocar-lhe algumas quest�es relativas aos seus sintomas.'), nl, 
	write('Menu:'), nl,
	write('**   1- Iniciar'), nl,
	write('**   2- Sair'), nl,
	read(B),
	escolha(B).

escolha(1):- perguntas, 
	resultado.
escolha(2):- write('Até à próxima!'), halt.
escolha(other):- write('Introduza uma opcao valida, por favor comece de novo'), menu.

perguntas :- p_espirros, p_corrimento, p_tosse, p_dor_garganta, p_dor_cabeca, p_febre, p_mal_estar,
	p_diarreia, p_obstrucao_nasal, p_calafrios, p_dor_muscular, p_fadiga, p_perda_apetite, p_dor_respiracao, p_falta_ar.

p_espirros:- 
	write('Espirra?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(espirros:1))); P1 == 2).

p_corrimento:- 
	write('Tem corrimento nasal?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(corrimento_nasal:1))); P1 == 2).

p_tosse:- 
	write('Tem tosse?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(tosse:0.9))); P1 == 2).

p_dor_garganta:- 
	write('Dói-lhe a garganta?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(dor_garganta:0.8))); P1 == 2).

p_dor_cabeca:- 
	write('Dói-lhe a cabeça?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(dor_cabeca:0.9))); P1 == 2).

p_febre:- 
	write('Tem febre?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(febre:0.7))); P1 == 2).

p_mal_estar:- 
	write('Sente um mal estar geral?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(mal_estar:0.9))); P1 == 2).

p_diarreia:- 
	write('Tem diarreia?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(diarreia:0.9))); P1 == 2).

p_obstrucao_nasal:- 
	write('Tem o nariz entupido?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(obstrucao_nasal:0.9))); P1 == 2).

p_calafrios:- 
	write('Tem calafrios?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(calafrios:0.6))); P1 == 2).

p_dor_muscular:- 
	write('Sente dor muscular?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(dor_muscular:0.5))); P1 == 2).

p_fadiga:- 
	write('Sente-se cansado?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(fadiga:0.7))); P1 == 2).

p_perda_apetite:- 
	write('Perdeu apetite?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(perda_apetite:0.9))); P1 == 2).

p_dor_respiracao:- 
	write('Sente dor ao respirar?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(dor_respiracao:1))); P1 == 2).

p_falta_ar:- 
	write('Sente falta de ar?'),nl,
	write('1- Sim.'),nl,
	write('2- Não.'),nl,
	write('A sua opcao e :'),read(P1),
	   (((P1 == 1), assert(fact(falta_ar:1))); P1 == 2).

resultado :- 
    doencas(L1),
    get_certainties(L1, L2),
    get_proofs(L2, L3),
	result,
    get_tratamentos(L3,L4),
    (
        % Verifica se há tratamentos identificados
        (
            L4 = [],
            write('Não foi possível identificar a doença com certeza. Por favor, consulte um médico para obter um diagnóstico preciso.')
        );
        % Se há tratamentos identificados, apresenta os resultados normalmente
        (
            apresentar_resultados(L4)
        )
    ),
    retractall(fact(_)).