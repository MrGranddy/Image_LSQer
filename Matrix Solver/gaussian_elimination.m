function [y1, y2] = gaussian_elimination(A, b)
for i = 1:2
    b(i,1) = b(i,1) / A(i,i);
    A(i,:) = A(i,:) / A(i,i);
    for j = i+1:3
        coefficient = A(j,i) / A(i,i);
        for k = i:3
            A(j,k) = A(j,k) - A(i,k) * coefficient;
        end
        b(j,1) = b(j,1) - b(i,1) * coefficient;
    end
end
b(3,1) = b(3,1) / A(3,3);
A(3,:) = A(3,:) / A(3,3);
y2 = b;
y1 = A;
end
