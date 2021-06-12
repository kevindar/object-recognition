% Step 1 read image
RGB = imread('pills_etc.png');
figure(1)
imshow(RGB)

% Step 2 Threshold image
I = rgb2gray(RGB);
threshold = graythresh(I);
bw = im2bw(I, threshold);
figure(2)
imshow(bw)

% Step 3 Menghilangkan noise
% remove all object containing fewer than 30 pixels
bw = bwareaopen(bw,30);
% fill a gap in the pen's cap
se = strel('disk',2);
bw = imclose(bw,se);
% fill any holes, so that regionprops can be used to estimate
% the area enclosed by each of the boundaries
bw = imfill(bw,'holes');
figure(3)
imshow(bw)

% Step 4 Mencari Boundaries
[B,L] = bwboundaries(bw,'noholes');
% Display the label matrix and draw each boundary
figure(4)
imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
boundary = B{k};
figure(5)
plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end

% Step 5 Menentukan objek bulat / lingkaran

stats = regionprops(L,'Area','Centroid');
threshold = 0.94;
% loop over the boundaries
for k = 1:length(B)
% obtain (X,Y) boundary coordinates corresponding to label 'k'
boundary = B{k};
% compute a simple estimate of the object's perimeter
delta_sq = diff(boundary).^2;
perimeter = sum(sqrt(sum(delta_sq,2)));
% obtain the area calculation corresponding to label 'k'
area = stats(k).Area;
% compute the roundness metric
metric = 4*pi*area/perimeter^2;
% display the results
metric_string = sprintf('%2.2f',metric);
% mark objects above the threshold with a black circle
if metric > threshold
centroid = stats(k).Centroid;
plot(centroid(1),centroid(2),'ko');
end
text(boundary(1,2)-35,boundary(1,1)+13,metric_string,'Color','y',...
'FontSize',14,'FontWeight','bold');
end
title(['Metrics closer to 1 indicate that ',...
'the object is approximately round']);