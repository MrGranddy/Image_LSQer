function y = yap2(img, katsayilar, sqSize)
[m, n] = size(img);
new = zeros(m,n);
for row = 1:floor(m/sqSize)
    for col = 1:floor(n/sqSize)
        for krow = 1:sqSize
            for kcol = 1:sqSize
                new((row-1)*sqSize + krow, (col-1)*sqSize + kcol) = katsayilar(1,(row-1)*floor(n/sqSize) + col)*kcol^3 + katsayilar(2,(row-1)*floor(n/sqSize) + col)*kcol^2 + katsayilar(3,(row-1)*floor(n/sqSize) + col)*kcol + katsayilar(4,(row-1)*floor(n/sqSize) + col)*krow^3 + katsayilar(5,(row-1)*floor(n/sqSize)+col) * kcol^2 + katsayilar(6,(row-1)*floor(n/sqSize) + col)*kcol;
            end
        end
    end
end
y = new;
end
                
        