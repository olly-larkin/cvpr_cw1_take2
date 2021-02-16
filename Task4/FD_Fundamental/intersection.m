function [x, y] = intersection(coeffs)

s = size(coeffs);
x_arr = [];
y_arr = [];

for i = 1:s(1)
    for j = 1:s(1)
        if i ~= j
            x_int = - (coeffs(i,2) - coeffs(j,2)) / (coeffs(i,1) - coeffs(j,1));
            y_int = coeffs(i,1) * x_int + coeffs(i,2);
            x_arr = [x_arr x_int];
            y_arr = [y_arr y_int];
        end
    end
end

x = mean(x_arr);
y = mean(y_arr);
    
end

