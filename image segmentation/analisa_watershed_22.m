% Analisa Watershed
% Kelompok 22 PSSM
% Kevin Darmawan (1806148744)
% Muhammad Miftah Faridh (1806148782)

% 1. binary image dengan 2 lingkaran
center1 = -10;                      
center2 = -center1;
dist = sqrt(2*(2* center1)^2);
radius = dist/2 * 1.4;
lims = [floor(center1-1.2*radius) ceil(center2+1.2*radius)];
[x,y] = meshgrid(lims(1):lims(2));
bw1 = sqrt((x-center1).^2 + (y-center1).^2) <= radius;
bw2 = sqrt((x-center2).^2 + (y-center2).^2) <= radius;
bw = bw1 | bw2;
figure(1),imshow(bw,'InitialMagnification','fit'),title('bw')
title('bw')

% 2. Menghitung distance transform komplemen binary image
D = bwdist(~bw);
figure(2),imshow(D, []),title('Distace transform of ~bw')


% 3. Komplemen distance transform dan mengubah pixel non objek => -lnf 
D = -D;
D(~bw) = -Inf;

% 4. Watershed transform dan label matrix (RGB image)
L = watershed(D);
rgb = label2rgb(L,'jet',[.5 .5 .5]);
figure(3),imshow(rgb,'InitialMagnification','fit'),title('Watershed transform of D')
