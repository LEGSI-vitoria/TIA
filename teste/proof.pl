% result_proof(D, Proof) Proof is a proof that P is true
% get_proofs([D,P,E]) E = explicação (proof)

result_proof(P, P)  :-
   fact(P:_).
result_proof(P, P <= CondProof)  :-
   if Cond then P:_,
   result_proof(Cond, CondProof).
result_proof(P1 and P2, Proof1 and Proof2)  :-
   result_proof( P1, Proof1),
   result_proof(P2, Proof2).
result_proof(P1 or P2, Proof)  :-
   result_proof(P1, Proof);
   result_proof(P2, Proof).

get_proofs([],[]).
get_proofs([(D,P)|R], L):-
   get_proofs(R, R2), %obter explicações para as doenças seguintes
   (
      (result_proof(D,E), %assignar a explicação a uma variável 
      L = [(D,P,E)|R2]); %submeter explicação para a lista
      L = R2
   ).