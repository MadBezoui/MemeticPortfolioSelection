function Xsol=generer_solution(n,m,k,s,lb,ub)
% Cette fonction g?n?re une solution r?alisable.
% n: size of the solution
% k: cardinality
% lb: Lower bound
% ub: Upper bound
% Example: 
m=7; n=10; k=4; lb=0.1; ub=0.9; 
Xsol=zeros(n,1);
p = randperm(n);
indices = p(1:k);
xx=rand(k,1);
xx=xx./(sum(xx));% La contrainte de budget
% La contrainte de quantit?.
sghir=find(xx<lb);
for i=1:length(sghir)
      [~,ind_max]=max(xx);
      xx(ind_max)=xx(ind_max)-(lb-xx(sghir(i)));
      xx(sghir(i))=xx(sghir(i))+(lb-xx(sghir(i)));
end
Xsol(indices)=xx;% La contrainte de Cardinalit?
