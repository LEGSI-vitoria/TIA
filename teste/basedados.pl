%bd(nome,febre,tosse,espirros,dor_barriga)
%bd doenca(doença,tratamento)
%get_tratamentos([doença, probabilidade, explicação, tratamento])

doencas([infeccao_viral_respiratoria,covid,constipacao,gripe,pneumonia,amigdalite,sinusite,resfriado_comum,febre_tifoide,asma,faringite,tuberculose,bronquite,dengue,malaria,pneumonia_viral,covid_mucoso]).

tratamento(infeccao_viral_respiratoria, 'Sintomático. Repouse, hidrate-se e tenha uma alimentação leve.').
tratamento(covid, 'Sintomático. Repouse, hidrate-se e tenha uma alimentação leve.').
tratamento(constipacao, 'Sintomático. Repouse, hidrate-se e tenha uma alimentação leve.').
tratamento(gripe, 'Sintomático. Repouse, hidrate-se e tenha uma alimentação leve.').
tratamento(pneumonia, 'Consulte um médico. O seu tratamento dependerá do tipo de pneumonia.').
tratamento(amigdalite, 'Geralmente tratada com antibióticos. Repouse e mantenha-se hidratado.').
tratamento(sinusite, 'Descanse, mantenha-se hidratado e use descongestionantes nasais. Consulte um médico se os sintomas persistirem.').
tratamento(resfriado_comum, 'Descanse, mantenha-se hidratado e tome medicamentos de venda livre para aliviar os sintomas.').
tratamento(febre_tifoide, 'Tratamento com antibióticos e terapia de reidratação.').
tratamento(asma, 'Use medicamentos para controlar os sintomas.').
tratamento(faringite, 'Descanse, beba líquidos quentes e gargareje com água salgada para aliviar os sintomas.').
tratamento(tuberculose, 'Tratamento com antibióticos e acompanhamento médico regular.').
tratamento(bronquite, 'Repouse, beba muitos líquidos e use medicamentos para aliviar a tosse e a respiração difícil.').
tratamento(dengue, 'Repouse, mantenha-se hidratado e consulte um médico para monitoramento dos sintomas e tratamento de suporte.').
tratamento(malaria, 'Tratamento com medicamentos antimaláricos.').
tratamento(pneumonia_viral, 'Repouse, mantenha-se hidratado e consulte um médico para avaliação e possível tratamento com antivirais.').
tratamento(covid_mucoso, 'Repouse, mantenha-se hidratado e monitore seus sintomas de perto.').



get_tratamentos([], []).
get_tratamentos([(D,P,E)|R], L) :- 
   get_tratamentos(R, R2), %obter trataments para as doenças seguintes
   (
      (
         tratamento(D,T), %assignar o tratamento a uma variável 
         L = [(D,P,E,T)|R2]
      ); %submeter tratamento para a lista
      L = R2
   ).
    
apresentar_resultados([]).
apresentar_resultados([(D,P,E,T)|R]):-
   write('Pode ter '), write(D), write(' com '), write(P), write('% de certeza. A explicação é '),  
   write(E), write(' e o tratamento '), write(T),
   nl, apresentar_resultados(R).

%fact(espirros:0.2).
%fact(corrimento_nasal:0.5).
%fact(tosse:0.9).
%fact(dor_garganta:0.7).
%fact(dor_cabeca:0.7).
%fact(febre:0.6).
%fact(mal_estar:0.8).
%fact(obstrucao_nasal:0.9).