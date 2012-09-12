
octave_settings;

i_path= "/home/goa-tz/debug/dbg";





[content,err,msg]=readdir(i_path);

for i=3:1:(numel(content))
	
	file_str=content{i};
	
	load_path=[i_path,"/",file_str];
	
	
	list=load(load_path);
	
	polygon.vertices=polygonVertexList(list);
	polygon.num_vertices=size(polygon.vertices,1);
	polygon.color=rand(1,3);
	polygon.name = file_str;
	plotAxes(0.1);
	polygonViewer(polygon,"points");


end
