close all;
clear all;
clc;





a=linspace(0,1,10)';

y1=a+1;

y2=a+2;

y=[y1,y2,y2];
map=[1,3];
b=0;
legend={'uno','due','tre'};
c={'r','g','b'};
t={'t1','t2','t3'};
extras=[legend;c;t];
figure(1);
plot_subs(a,y,map,extras);



