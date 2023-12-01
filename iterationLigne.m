function [lambda,u] =iterationLigne(A,X,Y)
%X and Y can be any vectors at the begining
%we want to find the eigenvalue with the highest module and the associated
%line eigenvector
    while norm((Y-(Y'*X)*X))>0.00000000001
        X=Y/norm(Y);
        Y=A'*X;
    end
    lambda=X'*Y;
    u=X';
end