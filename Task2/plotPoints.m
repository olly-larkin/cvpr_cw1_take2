load('img1&2_points.mat')
figure(1)
imshow(imread('PNGs/DSC_0017.png'))
hold on;
plot(x1, y1, 'ro', 'LineWidth', 2, 'MarkerSize', 5); 
figure(2)
imshow(imread('PNGs/DSC_0019.png'))
hold on;
plot(x2, y2, 'ro', 'LineWidth', 2, 'MarkerSize', 5); 