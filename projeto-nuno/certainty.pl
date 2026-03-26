% result_certainty(D, P) P = probabilidade de algo ser verdade
% get_centainties([D,P,E]) P = probabilidade (certainty)

% Rule interpreter with certainties

% result_certainty( Proposition, Certainty)

result_certainty( P, Cert)  :-
   fact( P: Cert).

result_certainty( Cond1 and Cond2, Cert)  :-
   result_certainty( Cond1, Cert1),
   result_certainty( Cond2, Cert2),
   Cert is min( Cert1, Cert2).

result_certainty( Cond1 or Cond2, Cert)  :-
   result_certainty( Cond1, Cert1),
   result_certainty( Cond2, Cert2),
   Cert is max( Cert1, Cert2).

result_certainty( P, Cert)  :-
   if Cond then P : C1,
   result_certainty( Cond, C2),
   Cert is C1 * C2.

get_certainties([],[]).
get_certainties([D|R], L):-
   get_certainties(R, R2), %obter probabilidade para as doenças seguintes
   (
      (result_certainty(D,P), %assignar a probabilidade a uma variável 
      L = [(D,P)|R2]); %submeter probabilidade para a lista
      L = R2 
   ).
