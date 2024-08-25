function [pop]=generer_population(n,m,k,s,lb,ub)
pop=[];
% n=20; m=10; k=5;s=2; lb=0.1; ub=0.9;
% Example: 
%m=10; n=10; k=4; lb=0.1; ub=0.9 ,s=2; 
 for j=1:n
      Xsol=generer_solution(m,k,lb,ub);
     pop=[pop Xsol];
 end
end