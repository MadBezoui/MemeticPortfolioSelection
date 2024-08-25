function [pop]=generer_pop(n,m,k,s,lb,ub)
pop=[];
% Example:
%n=20; m=10; k=5;s=2; lb=0.1; ub=0.9;
for j=1:n
    xsol=generer_sol(m,k,s,lb,ub);
    pop=[pop xsol];
end 
end 