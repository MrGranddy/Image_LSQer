function y = forward_substitution(A, b, n)
x = zeros(n,1);
x(1,1) = b(1,1) / A(1,1);
for i = 2:n
    temp = b(i,1);
    for j = 1:i - 1
        temp = temp - A(i,j) * x(j,1);
    end
    x(i,1) = temp / A(i,i);
end
y = x;
end
