function polygonViewer(polygon,mode)
% --Function File: polygonViewer(polygon,mode)
%   
%   Function can be used to display the contours
%   and vertices of polygons(as defined in polygonDef.m)
%
%   Modes:
%   	- "single" mode uses a new figure
%	- "multi" mode uses current figure
%	- "bw" plots only black polygons
%
%   - "points" mode only prints markers on vertices
%   - "p_num" mode just prints the number of the vertex instead of a marker
%------------------------------------------------------------------
% goa-tz - 2012/08/21

	draw_p_num = false;
    draw_points = false;
    draw_lines = true;
if(nargin==1)
	gcf();
	mode="multi";
	color=polygon.color;

end

if (nargin==2)

	if  (strcmp(mode,"single")==1)
	%use current figure or create new one
	gcf();
	color=polygon.color;
	end


	if (strcmp(mode,"multi")==1)
	figure('Position',[0,0,500,500]);
	color=polygon.color;
	end


	if (strcmp(mode,"bw")==1)
	gcf();
	color=[0 0 0];
	end
	
	if(strcmp(mode,"points") ==1)
	gcf();
	color = polygon.color;
	draw_lines = false;
	draw_p_num = false;
    draw_points = true;
	end
	
	if(strcmp(mode,"p_num") ==1)
	gcf();
	color = polygon.color;
	draw_lines = false;
	draw_p_num = true;
    draw_points = false;	
	end

	
	
end

hold on;

if(draw_points ==true)
    for i=1:1:polygon.num_vertices
        plot3(polygon.vertices(i,1),polygon.vertices(i,2),polygon.vertices(i,3),'o','MarkerSize',5,'Color',color);
    end
end

if(draw_p_num == true)
    
    for i=1:1:polygon.num_vertices
        text(polygon.vertices(i,1),polygon.vertices(i,2),polygon.vertices(i,3),num2str(i-1),'Color',color)
    end

end
end

if(draw_lines ==true)
    plot3(polygon.vertices(:,1),polygon.vertices(:,2),polygon.vertices(:,3),'Color',color);
    plot3([polygon.vertices(end,1);polygon.vertices(1,1)],[polygon.vertices(end,2);polygon.vertices(1,2)],[polygon.vertices(end,3);polygon.vertices(1,3)],'Color',color);
end



txt = polygon.name;


text (polygon.vertices(end,1),polygon.vertices(end,2),polygon.vertices(end,3),txt,'Color',color);
