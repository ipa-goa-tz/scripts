function out=polygonExpand(polygon)
% out= polygon_(polygon)
%
% TODO write help
%
%–––goa-tz, 2012/06/14~~~~~


out=polygon;

% using default axes
axes.x=[1 0 0];
axes.y=[0 1 0];
axes.z=[0 0 1];


out.sides=polygonSides(polygon);
out.vertices=polygonVertices(out,axes);
out.normal=polygonNormal(out);
out.d=polygonDistance(out);




