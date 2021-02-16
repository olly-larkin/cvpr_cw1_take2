frameLeftGray  = rgb2gray(imresize(I1Rect,0.3));
frameRightGray = rgb2gray(imresize(I2Rect,0.3));
    
disparityMap = disparitySGM(frameLeftGray, frameRightGray, 'DisparityRange', [-64 64]);
figure;
imshow(disparityMap, [-64, 64]);
title('Disparity Map');
colormap jet
colorbar