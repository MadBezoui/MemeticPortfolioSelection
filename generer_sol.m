function xsol=generer_sol(m,k,s,lb,ub)
%m=10;k=5;s=2; lb=0.1;
xx=zeros(m,1);
% pre assignment constraint
indices1=randperm(m,s);
val1=rand(s,1);
xx(indices1)=val1;
val2=rand(k-s,1);
y=find(xx==0);
indicepermute=randperm(numel(y));
b=y(indicepermute);
indices2=b(1:k-s);
xx(indices2)=val2;
xx=xx./sum(xx); %la contrainte budgetaire
solmin=find(0<xx & xx<lb);%la contrainte de quantité
for i=1:length(solmin)
       [~,ind_max]=max(xx);
      xx(ind_max)=xx(ind_max)-(lb-xx(solmin(i)));
      xx(solmin(i))=xx(solmin(i))+(lb-xx(solmin(i)));
end
xsol=xx;
end