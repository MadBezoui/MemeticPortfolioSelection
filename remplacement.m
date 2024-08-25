function  pop=remplacement(Q,R,F,E1,pop)
      X=E1;
       E=evaluation(Q,R,X);
       [maxF,i1max]=max(F);
       if E<maxF
            maxF=E;
           pop(:,i1max)=E1;
       end
%        X=E2;
%        E=evaluation(Q,R,X);
%        [maxF,i2max]=max(F);
%        if E<maxF
%            maxF=E;
%            pop(i2max,:)=E2;
%        end
end