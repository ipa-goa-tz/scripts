clc;clear all; close all;



function out=normalizeVector(in)

	n=norm(in);
	out=in./n;


end




%load data

in=load('/debug/sp');


figure('Position',[0,0,500,500]);

hold on;

for(i=1:1:length(in))

index=(i-1)*i
x(i)=in(index+1)
y(i)=in(index+2)
z(i)=in(index+3)


%plot vertices
plot3(x(i),y(i),z(i),'r','MarkerSize',20);
end


contours=[x',y',z'];

% plot contours
plot3(x(:),y(:),z(:),'k');
plot3([x(end);x(1)],[y(end);y(1)],[z(end);z(1)],'k');









































