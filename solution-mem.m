function Xsol=solution_mimetique(n,k,s,lb,ub)
n=10;k=5;s=2; lb=0.1;
xx=zeros(n,1);
% pre assignment constraint
indices1=randperm(n,s);
val1=rand(s,1);
xx(indices1)=val1;
val2=rand(k-s,1);
y=find(xx==0);
indicepermute=randperm(numel(y));
b=y(indicepermute);
indices2=b(1:k-s);
xx(indices2)=val2;
xx=xx./sum(xx); %la contrainte budgetaire
sghir=xx(0<xx & xx<lb);%la contrainte de quantité
for i=1:length(sghir)
      [~,ind_max]=max(xx);
      xx(ind_max)=xx(ind_max)-(lb-xx(sghir(i)));
      xx(sghir(i))=xx(sghir(i))+(lb-xx(sghir(i)));
end
xx(indices1,indices2)=xx;