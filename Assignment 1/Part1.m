data = imread('D:\__RESEARCH\[Coursera] DYNAMICAL MODELLING for SYSTEMS BIOLOGY\Assignment 1\flash4.jpg', 'jpg');

img = transpose(data);
imgsc = imagesc(img);

clim([0 255]);
colormap cool;
