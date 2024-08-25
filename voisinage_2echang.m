function Voisin=voisinage_2echang(Xvoisin,RL)
Voisin=[];
for j=1:RL
U=length(Xvoisin);
ii=randi(U);
a=Xvoisin(ii);
jj=randi(U);
Xvoisin(ii)=Xvoisin(jj);
Xvoisin(jj)=a;
Voisin=[Voisin Xvoisin];
end
end
