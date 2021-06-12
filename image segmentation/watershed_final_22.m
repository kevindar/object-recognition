% Watershed Transformation
% Kelompok 22 PSSM
% Kevin Darmawan (1806148744)
% Muhammad Miftah Faridh (1806148782)

% Membaca image dan menerapkan global image threshold dengan Otsu's method 
I = imread('img_cells.jpg');
T = graythresh(I);
BW = im2bw(I, T);
figure(1);
imshowpair(I,BW,'montage'); % menampilkan perbandingan sebelum sesudah threshold

% Mengisi interior gap dari gambar sel
BW2 = bwareaopen(BW,125); 
figure(2);
imshow(BW2);
title('Fill interior gap');

% Menerapkan Multivariable Thresholding dengna Euclidean Transform pada image
D = bwdist(BW2);
figure(3)
imshow(D, [], 'InitialMagnification', 'fit')
title('Euclidean transform');

% Segmentasi menggunakan Watershed 
L = watershed(D);
L(BW2) = -Inf;
rgb = label2rgb(L, 'jet', [.5, .5, .5]);
figure(4)
imshow(rgb, 'InitialMagnification', 'fit')
title('Watershed Transform');