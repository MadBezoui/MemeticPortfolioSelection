function F=evaluation(Q,R,X)

 F1=X'*Q*X;
 F2=-R'*X;
 F=F1+F2;
end