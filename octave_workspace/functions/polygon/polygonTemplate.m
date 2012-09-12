function p=polygonTemplate(template)
%--Function File: polygonTemplate()
%
%  Definition of struct polygon.
%  Available Templates:
%	- "rect" rectangle
%
%–––––––– goa-tz - 2012/06/15 ––––––––––––––––––––
	
if(nargin==0)
	template="default";
end

if(nargin ==1 && isempty(template)==1)
	template="default";
end
	

switch template

case "rect"
	polygon.area=1;
	polygon.side_ratio=1;
	polygon.centroid=[0 0 0]';
	polygon.num_vertices=4;
	p=polygonExpand(polygon);
	

case "default"
	p.vertices=[0, 0, 0 ; 0, 0, 0; 0, 0, 0;]; % matrix containing vertices of poylgons
	p.num_vertices=size(p.vertices,2);	  % number of vertices 
	p.color=rand(1,3);			  % color of polygon(for plots)
	p.normal=[0,0,0]';			  % normal vector of polygon
	p.d=0;					  % distance to origin	
	p.centroid=[0 0 0];			  % centroid of polygon
	p.area=0;				  % area of polygon
	p.side_ratio=1;				  % ratio of sides (rectangle)
	p.sides=[0 0];				  % length of polygon sides
	p.name = "polygon";			  % name of polygon
	
endswitch


end
