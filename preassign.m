n=10;
k=5;
s=3;
 x=zeros(n,1);
   indices1=randperm(s);
 val1=rand(s,1);
 x(indices1)=val1;
  indices2=s+1:k;
 idx=randperm(length(indices2));
 indices2(idx);
 val2=rand(k-s,1);
 x(indices2)=val2;
 x=x./sum(x);
 sghir=find(0<x & x<lb);
for i=1:length(sghir)
      [~,ind_max]=max(x);
      x(ind_max)=x(ind_max)-(lb-x(sghir(i)));
      x(sghir(i))=x(sghir(i))+(lb-x(sghir(i)));
end
