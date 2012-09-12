
clc;
clear all;
close all;




negate_normal=true;


poly_orig=polygonTemplate("rect");





shift=[0 0.01 0];

poly_1=polygonShift(poly_orig,shift);
poly_2=polygonShift(poly_orig,-shift);
poly_1.id=1;
poly_2.id=2;

poly_2.color=[1 0 0];
poly_1.color=[0 1 0];

figure('Position',[0 0 400 400 ])
plotAxes;
viewer_mode="single";
polygonViewer(poly_1,viewer_mode);
polygonViewer(poly_2,viewer_mode);


% artificially turn around normal

poly_1.normal=-poly_1.normal;

polygon2MapEntry(poly_1,"new");
polygon2MapEntry(poly_2,"add");



