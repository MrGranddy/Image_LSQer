function y = svd_compress(gray,n)
[U,S,V] = svd(gray,'econ');
a = U(:,1:n) * S(1:n,1:n) * transpose(V(:,1:n));
b = uint8(a);
imshow(b);
y = b;
end