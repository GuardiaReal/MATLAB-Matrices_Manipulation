%Tristan CAPUTO
%MATH475A_Hw5
%Power Iteration Method
%Function takes n by n matrix A, initial guess x, max iterations N and
%tolerance, outputs largest eigenvalue with associated eigenvector

function [v,l,j] = PowerIterations(A, x, N, tol)

l_old = 0;
k=1;

x = x/sqrt(x'*x);                       %normalizing initial guess

while (k <= N)
    x_new = A*x;
    l_new = x'*x_new;                   %Computing eigenvalue
    if (abs(x_new)==0) 
        fprintf('x is an eigenvector corresponding to zero\n');
        return;
    end
    
    x_new = x_new/sqrt(x_new'*x_new);   %normalizing eigenvector
    err = l_new-l_old;                  %Evaluating error
    if (abs(err)<tol)
        v = x_new;                      %Returning output to calling script
        l = l_new;
        j=k;
        return;                       
    end
    
    x = x_new;                          %Re-assigning variables for next iteration
    l_old = l_new;
    k=k+1;                              % Incrementing loop index
end

fprintf('ERROR: Maximum number of iterations exceeded\n');
return;
    
    
end




