n=10;
k=4;
s=2;
x=zeros(n,1);
indices1=p(1:s);
val1=rand(s,1);
x(indices1)=val1;
indices2=p(s+1:k);
val2=rand(k-s,1);
x(indices2)=val2;