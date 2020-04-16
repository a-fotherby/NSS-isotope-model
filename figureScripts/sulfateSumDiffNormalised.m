load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case1.mat')
ans =  SO4_sum - SO4;
ans = ans ./ SO4_sum .* -1;
depth = 1:l;
depth = (depth .* dz)';

plot(ans, depth);
set(gca,'YDir','reverse');
set(gca,'XAxisLocation','Top');
pbaspect([1 2 1]);

xlabel(gca, 'Percentage error');
ylabel(gca, 'Depth (cm)');

exportgraphics(gca, '/Users/angus/Dropbox/Academic/Isotope Model/Writeup/Figures/errorPlots/sumError.eps', 'ContentType', 'vector');