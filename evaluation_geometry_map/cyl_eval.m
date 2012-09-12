%Script is used for evaluation of Geometry Map
%Parameters are dumped via Eval Node
%Change Scenario info in follwing section


map = load("/home/goa-tz/debug/eval/01_noise_MAP");
seg = load("/home/goa-tz/debug/eval/01_noise_SEG");
mode_plot=false;
scenario='01_noise';

%origin
O2D=[1500 , -1500]
R =200
SA=[0,0,1000];


% load default settings
octave_settings()

format short

if mode_plot==false
    
set(0, 'defaultfigurevisible', 'on'); 
end 
%process scenario info
pwd=pwd();
%scenario_str=['/home/goa-tz/octave_workspace/data/',scenario,'/'];
scenario_str=['/share/goa-tz/evaluation_geometry_map/data/',scenario,'/'];
mkdir(scenario_str);
fprintf('Evaluation saving to %s \n',scenario_str);

write_meta(scenario,scenario_str);
%print input data
header={'frame','radius','origin x','origin y','origin z','centroid y','centroid y','centroid z','normal x','normal y','normal z','sym axis x','sym axis y','sym axis z'};
file = [scenario_str,scenario,'_MAP_raw'];
file_output(file,map,header,'txt',3);
file = [scenario_str,scenario,'_SEG_raw'];
file_output(file,seg,header,'txt',3);



seg(:,2:end)=seg(:,2:end)*1000;
map(:,2:end)=map(:,2:end)*1000;


%load data
frame = map(:,1);
r_map = map(:,2);
origin_map = map(:,3:5);
centroid_map = map(:,6:8);
normal_map = map(:,9:11);
sym_axis_map = map(:,12:14);


frame = map(:,1);
r_seg = seg(:,2);
origin_seg = seg(:,3:5);
centroid_seg = seg(:,6:8);
normal_seg = seg(:,9:11);
sym_axis_seg = seg(:,12:14);



epochs = linspace(0,length(r_map)-1,numel(r_map))';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluation of radius
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dr_map=r_map - R;
dr_seg=r_seg - R;
%STATS%%%%%%%%%%%%%%%%%%%%%%%%
file=[scenario_str,scenario,'_radius_difference'];
data = [dr_seg,dr_map];
stats(data,file);


data = [epochs,dr_seg,dr_map];
%make file output
header={'frame','d_r_seg','d_r_ map'};
file_output(file,data,header,'txt',3);


%PLOTS%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
%legend={'Geometry Map','Segmentationi','Geometry Map','Segmentation'};
legend={'Geometry Map','Segmentation'};
%colors={'r','b','r','b'};
colors={'r','b'};
title=' Difference in Radius';
mapping=[1];
%plot_subs(epochs,[r_map,r_seg,dr_map,dr_seg],mapping,colors,legend,title);
plot_subs(epochs,[dr_map,dr_seg],mapping,colors,legend,title);

print("-dpdf",[file,'_plot.pdf']);








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluation of Origin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plots for raw data


O2D_mat = repmat(O2D,numel(epochs),1);

dorigin_map = origin_map(:,1:2) - O2D_mat;
dorigin_seg = origin_seg(:,1:2) - O2D_mat ;


%figure(9)
%plot(epochs,origin_map(:,1),origin_seg(:,1),'ro')
%figure(19)
%plot(epochs,origin_map(:,2),origin_seg(:,2),'ro')

dist_origin_map=norm(dorigin_map,"rows");
dist_origin_seg=norm(dorigin_seg,"rows");
% STATS%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%make file output
data=[epochs,dist_origin_seg,dist_origin_map];
file=[scenario_str,scenario,'_origin_distance'];
header={'frame','dist_origin_seg','dist_origin_map'};
file_output(file,data,header,'txt',3);
data=[dist_origin_seg,dist_origin_map];
stats(data,file);



%PLOTS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%data = [origin_map(:,1),origin_seg(:,1),origin_map(:,2),origin_seg(:,2),dist_origin_map,dist_origin_seg];
data = [dist_origin_seg,dist_origin_map];
mapping=[1];
colors={'b','r'};
legend={'SEG - Distance','GM - Distance'};
title='Distance to Origin';
figure(3)
plot_subs(epochs,data,mapping,colors,legend,title);
print("-dpdf",[file,'_plot.pdf']);

figure(4);
plot_trace(origin_map,'r','x','GeometryMap');
plot_trace(origin_seg,'b','o','Segmentation');
%title('Track of origin - 3D')
%print("-dpdf",[file,'_3D_plot.pdf']);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluation of Symmetry Axis 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SA_mat = repmat(SA,numel(epochs),1);

dsym_axis_map=sym_axis_map - SA_mat;
dsym_axis_seg=sym_axis_seg - SA_mat;

data=[epochs,dsym_axis_seg,dsym_axis_map];
file=[scenario_str,scenario,'_symaxis_difference'];
header={'frame','SymAxis_X_SEG','SymAxis_Y_SEG','SymAxis_Z_SEG','SymAxis_X_MAP','SymAxis_Y_MAP','SymAxis_Z_MAP',};
file_output(file,data,header,'txt',3);
data=[dsym_axis_seg,dsym_axis_map];
stats(data,file);



figure(6)
title='Difference in Symmmetry Axis Coordinates';
mapping=[1,3,5];

legend={'GM - X','SEG - X','GM - Y','SEG - Y','GM - Z','SEG - Z'};
colors={'r','b','r','b','r','b'};
plot_subs(epochs,[dsym_axis_map(:,1),dsym_axis_seg(:,1),dsym_axis_map(:,2),dsym_axis_seg(:,2),dsym_axis_map(:,3),dsym_axis_seg(:,3)],mapping,colors,legend,title);

print("-dpdf",[file,'_plot.pdf']);


cd(pwd);





