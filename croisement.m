function [E1,E2]=croisement(P1,P2,lb,m,k)
testP1=[];
testP2=[]; 
%m=200;k=10;
i=1;
%satisfaction contrainte de cardinalit? 
for j=1:m
      if ((P1(j)~=0)&&(length(testP1)<=k))
          testP1(i,1)=P1(j);
          i=i+1;
      end
end
i=1;
for j=1:m
      if ((P2(j)~=0)&&(length(testP2)<=k))
         testP2(i,1) =P2(j);
         i=i+1;
      end 
    
end
testP=[testP1;testP2];
E1=zeros(m,1);
E2=zeros(m,1);
u=length(P1);
v=length(P2);
i=1;
 S=0;
 K=k*2;
 while S<K 
     condition=1;
     while  condition
           ii=randi(u);
           if (E1(ii)==0)
               condition=0;
           end
     end 
     condition=1;
     while condition==1;
   jj=randi(v);
   if (E1(jj)==0)
       condition=0;
   end
     end
   if(S<K)
    E1(ii,1)=testP(i);  
    S=S+1;
   end
   if(S<K)
    E2(jj,1)=testP(i+1);
    S=S+1;
   end
   i=i+2;
 end
 %satisfaction contrainte budg?taire 
 for i=1:m
E1(i)=((E1(i))/(sum(E1)));
 end
 %satisfaction contrainte de quantit? 
sghir=find(E1<lb);
for i=1:length(sghir)
      [~,ind_max]=max(E1);
      E1(ind_max)=E1(ind_max)-(lb-E1(sghir(i)));
      E1(sghir(i))=E1(sghir(i))+(lb-E1(sghir(i)));
end
%satisfaction contrainte budg?taire
  for i=1:m
E2(i)=((E2(i))/(sum(E2)));
  end
  %satisfication contrainte de cardinalit?
  sghir=find(E2<lb);
for i=1:length(sghir)
      [~,ind_max]=max(E2);
      E2(ind_max)=E2(ind_max)-(lb-E2(sghir(i)));
      E2(sghir(i))=E2(sghir(i))+(lb-E2(sghir(i)));
end
end