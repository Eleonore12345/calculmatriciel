
clear

%%PARTIE 1 : test

taille = 5;
A = randi(20, taille);
Y = randi(20,taille,1);
X = randi(20, taille,1);
deflation(A,X,Y,3)

%%PARTIE 2 : tambour
T=ones(15,40); %T représente le tambour
%Points fixés
T(1,1)=0; %coin supérieur gauche 
for j=1:40
    T(15,j)=0; %bord inférieur
end
for i=1:15
    T(i,40)=0; %bord droit
end
for j=15:40
    T(1,j)=0; %bord supérieur droit
end
for i=6:10
    T(i,10)=0; %ligne verticale la plus à gauche
    T(i,25)=0; %ligne verticale la plus à droite
end
T=reshape(T,600,1);

for i=1:600
    if (T(i)==0)
        M(i,i)=1;
    elseif i>1 & i<15 %bord gauche, 3 voisins
        M(i,i)=-3;
        M(i,i-1)=1;
        M(i,i+1)=1;
        M(i,i+15)=1;
    elseif ismember(i,[16:15:(1+13*15)]) %bord supérieur gauche, 3 voisins
        M(i,i)=-3;
        M(i,i-15)=1;
        M(i,i+15)=1;
        M(i,i+1)=1;

    else %cas général, 4 voisins
        M(i,i)=-4;
        M(i,i-1)=1;
        M(i,i+1)=1;
        M(i,i+15)=1;
        M(i,i-15)=1;
    end
end 



X=randi(50,600,1);
Y=randi(50,600,1);
[Val,Vect]=deflation(M,X,Y,55);
for i=1:600
    L=reshape(Vect(:,i),15,40);
    surf(L)
    pause(1);
end 



