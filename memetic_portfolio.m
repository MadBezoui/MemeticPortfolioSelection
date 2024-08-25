function population=memetic_portfolio(Q,R,lb,ub,~,k,n,nbr_iteration)
clc,
clear all;figure;
% k=10;%cardinalit?
% m=200;%nombre d'actifs
% Q=rand(m,m);%matrice de risque 
% Q=Q'*Q;
% R=rand(1,m);%vecteur rendement 
lb=0.01;%borne inferieur
nbr_iteration=1000;%condition d'arret"algorithme m?m?tique"
ub=0.9;%borne superieur 
n=100;%taille de la population
RL=10;% nombre d'it?ration de recherche locale
h=1;

% Data Portfolio
%QP=Hang_Seng_37;
%QP=DAX_100_85;
%QP=FTSE_100_89;
%QP=S_P_100_98
%QP=Nikkei_225;
%QP=EuroStoxx50
QP=SP500_478;
%QP=Nasdaq3037_2196; %pblm de mémoire
%Cardinality=[60];
k=10;%cardinality
m=size(QP.Dd,1);
Q=QP.Dd;R=QP.Rr;    
s=2;%pre_affectation
%End Data Portfolio

Sam=cell(20,1);

for iiii=1:n
pop=generer_pop(n,m,k,s,lb,ub);
GG=[];
while h < nbr_iteration
    %generer une nouvelle population 

%debut selection
for iii=1:n
    F1(iii)=pop(:,iii)'*Q*pop(:,iii);
    F2(iii)=-R'*pop(:,iii);
end
F=F1./max(abs(F1))+F2./max(abs(F2));
% plot(F1,F2,'*')
tmp=F;
[Fminn,i1min]=min(tmp);
P1=pop(:,i1min);
tmp(i1min)=Inf;
[~,i2min]=min(tmp); 
P2=pop(:,i2min);
%fin de selection
pop=recherche_locale(Q,R,pop,n,RL);
[E1,E2]=croisement(P1,P2,lb,m,k); 
% E1=mutation(E1,k); 
% E2=mutation(E2,k);
test=verification_sol(E1);
test=verification_sol(E2);
%appliquer la m?thode de recherche locale pour chaque enfant 
E1=recherche_locale2(Q,R,RL,E1);
E2=recherche_locale2(Q,R,RL,E2);
%verifier si la solution est r?lisable

if test==1
    pop=remplacement(Q,R,F,E1,pop); %si la solution est r?alisable on remplace dans pop
end
test=verification_sol(E2);
if test==1
    pop=remplacement(Q,R,F,E2,pop);
end

      population=pop;
      h=h+1;

%dessin----- 

for iii=1:n
    F1(iii)=population(:,iii)'*Q*population(:,iii);
    F2(iii)=-R'*population(:,iii);
end

% Non-Dominance

GG=[GG [F1;-F2]];




F=F1./max(abs(F1))+F2./max(abs(F2));
end
% %evaluer la population finale 
% hold on;
% plot(GG(1,:),-GG(2,:),'r*')
% plot(F1,-F2,'*','Color',[hh,0,1-hh])
% plot(F1,-F2,'y*');

EF=find(~IsDominated(F1,-F2));
Sam{iiii,1}=[F1(EF)' -F2(EF)'];
h=1;
%hold on;
plot(F1(EF)',-F2(EF)','b*');
end
%% Results
%hold on;
% plot(F1,-F2,'b*');
% plot(F1(EF),-F2(EF),'*r');
% xlabel('Risk');
% ylabel('Return');

% plot(Sam{iiii,1}(1),Sam{iiii,1}(2),'b*');
plot(F1(EF),-F2(EF),'*r');
 xlabel('Risk');
 ylabel('Return');

col_header={'RISK','RETURN'};
xlswrite('SP500 k10s2.xlsx',[F1(EF)',-F2(EF)'],'sheet1','A2');
%xlswrite('data10.xlsx',col_header,'sheet1','A1');
%save('res_Hang_K20.mat','Sam');
%save('SP_100_K50.mat','Sam');
%save('res_Hang_K20.mat','Sam');
end
