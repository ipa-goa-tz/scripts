octave_settings;


axes=defAxes;

r=1;
numVertices=4;
cyl_num=1;
for cyl =0:pi/2:pi
h=linspace(0,pi/2,4);
lambda=linspace(cyl,pi/num_Vertices,cyl+pi);


	Vertices(:,1) = r * cos(lambda);
	Vertices(:,2) = r * sin(lambda);
	Vertices(:,3) = h;


hold on
plotAxes
for i=1:1:numVertices
plot3(Vertices(i,1),Vertices(i,2),Vertices(i,3),'*','MarkerSize',20);
end

temp=axes(:,2);
axes(:,2)=axes(:,3);
axes(:,3)=temp;

c.vertices=Vertices;
c.r = r;
c.numVertices=numVertices;
c.axes=axes;
c.id=cyl_num;
c.origin=defOrigin;

cylinder2MapEntry(c,"add");
cyl_num=cyl_num+1;
end
