im = imread('../Images/DSC_0041.JPG');
s = size(im);

low_x = -2*s(2);
high_x = 7*s(2);
low_y = -1*s(1);
high_y = 4*s(1);

xFit = low_x:100:high_x;

figure;
imshow(im);
xlim([low_x high_x]);
ylim([low_y high_y]);
hold on;

coeff_h_left = zeros(4, 2);
for i = 1:4
    i_off = i - 1;
    coeff_h_left(i,:) = polyfit(x_left(i_off*5+1:i*5), y_left(i_off*5+1:i*5), 1);
    yFit = polyval(coeff_h_left(i,:), xFit);
    plot(xFit, yFit, 'y-');
end
[h_l_x, h_l_y] = intersection(coeff_h_left);
plot(h_l_x, h_l_y, 'yx', 'LineWidth', 2, 'MarkerSize', 20);

coeff_h_right = zeros(4, 2);
for i = 1:4
    i_off = i - 1;
    coeff_h_right(i,:) = polyfit(x_right(i_off*5+1:i*5), y_right(i_off*5+1:i*5), 1);
    yFit = polyval(coeff_h_right(i,:), xFit);
    plot(xFit, yFit, 'm-');
end
[h_r_x, h_r_y] = intersection(coeff_h_right);
plot(h_r_x, h_r_y, 'mx', 'LineWidth', 2, 'MarkerSize', 20);

coeff_v_left = zeros(5,2);
for i = 1:5
    i_off = i - 1;
    coeff_v_left(i,:) = polyfit(x_left(i:5:20), y_left(i:5:20), 1);
    yFit = polyval(coeff_v_left(i,:), xFit);
    plot(xFit, yFit, 'c-');
end
[v_l_x, v_l_y] = intersection(coeff_v_left);
plot(v_l_x, v_l_y, 'cx', 'LineWidth', 2, 'MarkerSize', 20);

coeff_v_right = zeros(5,2);
for i = 1:5
    i_off = i - 1;
    coeff_v_right(i,:) = polyfit(x_right(i:5:20), y_right(i:5:20), 1);
    yFit = polyval(coeff_v_right(i,:), xFit);
    plot(xFit, yFit, 'r-');
end
[v_r_x, v_r_y] = intersection(coeff_v_right);
plot(v_r_x, v_r_y, 'rx', 'LineWidth', 2, 'MarkerSize', 20);

coeff_1_bottom = zeros(5, 2);
for i = 1:4
    i_off = i - 1;
    coeff_1_bottom(i,:) = polyfit(x_bottom(i_off*4+1:i*4), y_bottom(i_off*4+1:i*4), 1);
    yFit = polyval(coeff_1_bottom(i,:), xFit);
    plot(xFit, yFit, 'g-');
end
[b_1_x, b_1_y] = intersection(coeff_1_bottom);
plot(b_1_x, b_1_y, 'gx', 'LineWidth', 2, 'MarkerSize', 20);

coeff_2_bottom = zeros(4,2);
for i = 1:5
    i_off = i - 1;
    coeff_2_bottom(i,:) = polyfit(x_bottom(i:4:20), y_bottom(i:4:20), 1);
    yFit = polyval(coeff_2_bottom(i,:), xFit);
    plot(xFit, yFit, 'b-');
end
[b_2_x, b_2_y] = intersection(coeff_2_bottom);
plot(b_2_x, b_2_y, 'bx', 'LineWidth', 2, 'MarkerSize', 20);

% Horizon Line
plot([b_1_x b_2_x]', [b_1_y b_2_y]', 'k-', 'Marker', 'none', 'LineWidth', 2);


