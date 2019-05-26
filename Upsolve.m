
function [Y] = Upsolve(L, b)

%BACKWARDS SUBSTITUTION Algorithm                               
for (k=n-1: -1: 1)
    for (j=k+1:n)
        sumBACK=L(k,j)*Y(j);              % Computing sum
    end
Y(k) = b1(k)-sumBACK/L(k,k);          % Solving for y
end

return Y;
end



