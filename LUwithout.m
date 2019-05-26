%Tristan Caputo
%8/28/2018
%MATH475A
%HW4_prog1
%Gauss-Elimination without Pivoting 



function [L,U] = LUwithout(A);
% Finds lower and upper triangular matrices of matrix A 


n=6;                    %dimension of nxn matrix

I=eye(n);                   % Identity matrix

for (k=1:n-1)               % indexing columns
    for (j=k+1:n)           % indexing rows
        m = A(j,k)/A(k,k);  
        A(j,:)=A(j,:)-m*A(k,:); % row substraction to get U
        I(j,k)=m;            % Assigning value changes to I --> L
      
    end
end

U=A;
L=I;


end

