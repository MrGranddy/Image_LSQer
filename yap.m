function y = yap(co, img, sqSize)
[m, n] = size(img);
as = zeros(sqSize^2, floor(m/sqSize)*floor(n/sqSize));
for row = 1:floor(m/sqSize)
    for col = 1:floor(n/sqSize)
        for krow = 1:sqSize
            for kcol = 1:sqSize
                as( (krow-1)*sqSize + kcol, (row-1)*floor(n/sqSize) + col ) = img( (row-1)*sqSize + krow, (col-1)*sqSize + krow);
            end
        end
    end
end
bs = zeros(6,(floor(m/sqSize))*(floor(n/sqSize)));
for row = 1:(floor(m/sqSize))
    for col = 1:(floor(n/sqSize))
        bs(:,(row-1) * floor(n/sqSize) + col) = lsqlin(co, as(:,(row-1)*floor(n/sqSize) + col));
    end
end
y=bs;
end
