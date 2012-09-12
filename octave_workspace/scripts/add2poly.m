gcf();
hold on;
origin =[-0.601425;-0.201374;0.806558];
centroid =[-0.563081;-0.187836;0.806465];
radius = 0.0417468;
normal =[ 0.943161;0.33233;-0.00226305];
sym_axis =[ 0.00461367;0.0199014;0.999791];
x_axis = [-0.406468;0.913445;-0.0200583];

merged = 1
merge_weight = 0

plot3(origin(1),origin(2),origin(3),"*","MarkerSize",5);

plot_normal=[origin';(origin+normal)'];
plot3(plot_normal(:,1),plot_normal(:,2),plot_normal(:,3),'Color','r');

plot3(centroid(1),centroid(2),centroid(3),'k*',"MarkerSize",5)

plot_sym=[origin';(origin+sym_axis)'];
plot3(plot_sym(:,1),plot_sym(:,2),plot_sym(:,3),"Color","b")

plot_x=[origin';(origin+x_axis)'];
plot3(plot_x(:,1),plot_x(:,2),plot_x(:,3),"Color","g")


