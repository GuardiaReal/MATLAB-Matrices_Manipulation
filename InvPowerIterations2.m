%Tristan CAPUTO
%MATH475A_Hw5

function [v,l,j] = InvPowerIterations2(A,x,N,tol,mu)

l_old = 0;
k=1;
x = x/sqrt(x'*x);
I=eye(size(A));

[L,U] = LUwithout(A-mu*I);

while (k<=N)
k=k+1;
y = L\x;
x_new = U\y;

lam = x'*x_new;

x_new = x_new/sqrt(x_new'*x_new);

err = l_old-lam;

if (abs(err)<tol)
    v=x_new;
    l=mu+(1/lam);
    j=k;
    return;
end

x=x_new;
l_old=lam;    
end

fprintf('ERROR:Maximum Number of iterations exceeded\n');

end

