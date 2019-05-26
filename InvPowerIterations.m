%Tristan CAPUTO
%MATH475A_Hw5
%Inverse Power Iteration
%Function takes n by n matrix A, initial guess x, max iterations N and
%tolerance, outputs eigenvalue with associated eigenvector


function [v, l, j] = InvPowerIterations(A, x, N, tol, mu)
                        
k=1;
I = eye(size(A)); 
B = inv(A-mu*I);                        % Creating (A-mu*I)^-1 matrix 
x_new = x;

while (k < N)
temp = x_new/sqrt(x_new'*x_new);
x_new = B*temp;                            % Computing eigenvector for matrix B
lam = temp'*x_new;                         % Computing eigenvalue for matrix B
err=x_new-lam*temp;                        % Computing error

if (abs(err)< tol)
    v = x_new/lam;                      %re-computing eigenvector for matrix A
    l = mu +1/lam;                      %re-computing eigenvalue for matrix A
    j = k;                              %returning # iterations
    return;
end

k=k+1;

end

fprintf('ERROR: Number of Iterations Exceeded\n');

end

