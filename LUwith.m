%Tristan Caputo
%8/28/2018
%MATH475A
%HW4_prog2
%Gauss-Elimination with Pivoting

function [P,L,U] = LUwith(A)

%A = [ 1 1 0 3; 2 1 -1 1; 3 -1 -1 2; -1 2 6 -1];
A = [1 1 1 1 1 1; 1 2 3 4 5 6; 1 4 9 16 25 36; 1 8 27 64 125 216;
    1 16 81 256 625 1296; 1 32 243 1024 3125 7776];
n=6 ;
k=1;
j=k+1;
I=eye(n);
P=eye(n);

for (k=1:n-1)
    [maxNum,maxIndex]=max(abs(A(k:n,k)));
    maxIndex = maxIndex+k-1;  

    if (maxNum==0)
        fprintf('ERROR: No Unique Solution exists\n');
    end
    
  
   
   A([maxIndex k],:) = A([k maxIndex],:);   %   Interchanging rows
 
   P([maxIndex k],:) = P([k maxIndex],:);   %  Interchanging rows
   
  
   I([maxIndex k],1:k-1) = I([k maxIndex],1:k-1);  % Interchanging rows without touching diagonals

    for (j=k+1:n)
        m = A(j,k)/A(k,k);
        A(j,:)=A(j,:)-m*A(k,:);
        I(j,k)=m;
        
    end
end

U=A;
L=I;

fprintf('U=\n');
disp(A);
fprintf('L=\n');
disp(L);
fprintf('P=\n');
disp(P);

fprintf('Checking P^T*L*U = A\n');
disp(P'*L*U);

end