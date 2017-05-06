function y = backwards_substitution(A, b, n)
x = zeros(n,1);
x(n,1) = b(n,1) / A(n,n);
for i = n-1:-1:1
    temp = b(i,1);
    for j = i + 1:n
        temp = temp - A(i,j) * x(j,1);
    end
    x(i,1) = temp / A(i,i);
end
y = x;
end

