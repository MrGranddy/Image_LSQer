function y = circle_creator(size)
ratio = 0.9;
img = ones(size, size);
n = floor(size * (ratio));
img = img * 255;
for i = 1:n
    for j = 1:n
        if (i - n/2)^2 + (j - n/2)^2 < (n/2)^2
            img(i + floor(size * (1-ratio) / 2), ...
                j + floor(size * (1-ratio) / 2)) = 0;
        end
    end
end
y = img;
end
