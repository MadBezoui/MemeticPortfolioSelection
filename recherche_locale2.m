function E1=recherche_locale2(Q,R,RL,E1)
Voisin=voisinage_2echang(E1,RL);
for i=1:RL
    X_test=Voisin(:,i);
F_test=evaluation(Q,R,X_test);
F=evaluation(Q,R,E1);
if (F_test<F)
    F=F_test;
    E1=X_test;
end
end
end
