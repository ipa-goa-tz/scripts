
octave_settings;

i_path= "/home/goa-tz/debug";





[content,err,msg]=readdir(i_path);

for i=3:1:(numel(content))
	
	file_str=content{i};
	
	load_path=[i_path,"/",file_str];
	
	
	list=load(load_path);
	
	
	plotAxes(0.1);

	plot3(list(:,1),list(:,2),list(:,3),'o','MarkerSize',5);




end
