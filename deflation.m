function [Values,Vectors]=deflation(A,X,Y,max)
    % X and Y are random vectors used for the iteration processes, the size
    % of one dim of A
    % A is the matrix whose eigenvalues and eigenvectors we want to find
    taille=length(Y);
    Values=zeros(taille,1);
    Vectors=zeros(taille);
    for i=1:max
        [lambda,v]=iterationColonne(A,X,Y); %will give the biggest eigenvalue and the associated column eigenvector 
        [lambda,u]=iterationLigne(A,X,Y); %will give the biggest eigenvalue and the associated line eigenvector
        A=A-(lambda*((v*u)/(u*v))); %deflation formula
        Values(i)=lambda;
        Vectors(:,i)=v;
    end
end