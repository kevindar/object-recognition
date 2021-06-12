close all
clear all;

%Matching by Correlation
f = imread( 'a.tif' );
ax1 = subplot(2,2,1);
imshow(f)

w = imread( 'b.tif' );
ax2 = subplot(2,2,2);
imshow(w)

g = abs ( normxcorr2(w,f) );
ax3 = subplot(2,2,3);
imshow(g)
%find all the max value
gT = g == max(g(:)); 
%find out how many peaks there are
idx = find(gT==1);
numel(idx)

%a single point is hard to see, increase its size
gT = imdilate( gT,ones(7));
ax3 = subplot(2,2,4);
imshow(gT)