function Solutions_ND=filer_Domin(Sam,taille)
% Cette fonction filtre les fonctions points domin?s
hold on;

Gg=[];
for ijkl=1:taille
    tempoo=Sam{ijkl,1};
    taille_i=size(tempoo,2);
    for jj=1:taille_i
        Gg=[Gg tempoo(:,jj)];
    end
end

% Exhaustif
plot(Gg(1,:),Gg(2,:),'r*');
Gg(1,:)=-Gg(1,:);
Solutions_ND=Gg;mm=size(Gg,2);


for ijkl=1:mm
    ijkl,
    for j=ijkl+1:mm
        resultat=all(Gg(:,ijkl)>=Gg(:,j)) & (sum(Gg(:,ijkl)>Gg(:,j))>=1);
        resultat2=all(Gg(:,ijkl)<=Gg(:,j)) & (sum(Gg(:,ijkl)<Gg(:,j))>=1);
        if resultat
            Solutions_ND=setdiff(Solutions_ND',Gg(:,j)','rows')';
        elseif resultat2
            Solutions_ND=setdiff(Solutions_ND',Gg(:,ijkl)','rows')';
            j=mm+1;
        end
    end
end

Solutions_ND(1,:)=-Solutions_ND(1,:);

plot(Solutions_ND(1,:),Solutions_ND(2,:),'b*');