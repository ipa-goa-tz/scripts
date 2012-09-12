
clc;
close all;
clear all;



function  dir_vec=lot(a,o,g)

dir_vec=cross(o-a,g);

end

% Eckpunkte---> globales system

cyl.corners=[-1.57 0 1; 1.57 0 1;1.57 0 -1;-1.57 0 -1];
cyl.centroid=[0 1 0];
cyl.axis=[0 0 1];
cyl.r=1.57;
cyl.origin=[0 0 0];
cyl.o_c=lot(cyl.centroid,cyl.origin,cyl.axis);


for i=1:1:size(cyl.corners,1)
%dir2=cross(cyl.origin-cyl.corners(i,:),cyl.axis);
dir2=lot(cyl.corners(i,:),cyl.origin,cyl.axis);

cos_alpha=dot(cyl.o_c,dir2,2)/(norm(cyl.o_c)*norm(dir2))
alpha=acos(cos_alpha);
fprintf("alpha= %f \n",alpha*(180/pi))


%Bogenlänge
if(cyl.corners(i,1)<0)
tx= -( cyl.r *alpha) ;
else
tx= ( cyl.r *alpha) ;
end

ty= 0;
tz=cyl.corners(i,3) ;


cyl.plane(i,1)=cyl.origin(1)+tx;
cyl.plane(i,2)=cyl.origin(2);
cyl.plane(i,3)=cyl.corners(i,3);

fprintf("Old corner %f %f %f \n",cyl.corners(i,1) ,cyl.corners(i,2) ,cyl.corners(i,3));
fprintf("New corner %f %f %f \n",cyl.plane(i,1) ,cyl.plane(i,2) ,cyl.plane(i,3));
fprintf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
end



