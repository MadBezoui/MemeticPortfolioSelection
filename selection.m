function [P1,P2]=selection(Q,R,pop,n)
j=1;
n=100;
QP=DAX_100_85;
Q=QP.Dd;R=QP.Rr;
%exemple

while (j < n+1) 
    X=pop(:,j);
    tmp=evaluation(Q,R,X);
    F(j)=tmp;
    j=j+1;
end 
[~,i1min]=min(F);
P1=pop(:,i1min);
[~,i2min]=min(F-F(i1min)); 
P2=pop(:,i2min);
end
