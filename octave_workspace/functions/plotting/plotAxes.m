function plotAxes(arg1,arg2,arg3)
% -- Function File: plotAxes()
% -- Function File: plotAxes(scale)
% -- Function File: plotAxes(origin)
% -- Function File: plotAxes(origin,axes)
% -- Function File: plotAxes(origin,axes,scale)
%
%    Produces a set of coordinate axes.
%		X-axis..... red
%		Y-axis..... green
%		Z-axis..... blue
%
%    If no argument is given the canonical base is taken
%
%––––––––––––––––– goa-tz - 2012/06/14 ––––––––––––––––––––––

gcf();
hold on



default_axes=[1 0 0; 0 1 0; 0 0 1];
default_origin=[0;0;0];
default_scale=1;

if(nargin == 0)

	axes=default_axes;
	origin=default_origin;
	scale=default_scale;
end


if(nargin==1)

	if(isvector(arg1)==1)

		axes=default_axes;
		origin=arg1;
		scale=default_scale;
	end

	if(isscalar(arg1)==1)

		axes=default_axes;
		origin=default_origin;
		scale=arg1;	
	end

	if(isempty(arg1)==1)

		axes=default_axes;
		origin=default_origin;
		scale=default_scale;	
	end
		
end

if(nargin==2)
	axes=arg2;
	origin=arg1;
	scale=default_scale;
end

if(nargin==3)

	axes=arg2;
	origin=arg1;
	scale=arg3;
end


x_axis=origin + (scale * vec_norm(axes(:,1)));
y_axis=origin + (scale * vec_norm(axes(:,2)));
z_axis=origin + (scale * vec_norm(axes(:,3)));

x_axis_2=origin + (scale * 0.5*vec_norm(axes(:,1)));
y_axis_2=origin + (scale * 0.5*vec_norm(axes(:,2)));
z_axis_2=origin + (scale * 0.5*vec_norm(axes(:,3)));


plot3([origin(1);x_axis(1)],[origin(2);x_axis(2)],[origin(3);x_axis(3)],'r','LineWidth',3);
plot3([origin(1);y_axis(1)],[origin(2);y_axis(2)],[origin(3);y_axis(3)],'g','LineWidth',3);
plot3([origin(1);z_axis(1)],[origin(2);z_axis(2)],[origin(3);z_axis(3)],'b','LineWidth',3);

text(x_axis_2(1),x_axis_2(2),x_axis_2(3)-(0.1*scale),'X','FontSize',20)
text(y_axis_2(1),y_axis_2(2),y_axis_2(3)-(0.1*scale),'Y','FontSize',20)
text(z_axis_2(1)-(0.2*scale),z_axis_2(2),z_axis_2(3),'Z','FontSize',20)



end

