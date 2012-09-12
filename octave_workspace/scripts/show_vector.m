

close all;
clear all;
clc
vector_a=[ 1 0 1];
vector_b=[1.5 0 4];

origin = [0 0 0];

% write the vectors you want to visualize in this matrix (as rows)
vectors=[vector_a;vector_b];

hold on

for i=1:1:size(vectors,1)
color=rand(3,1);
mat = [origin;vectors(i,:)];
plot3(mat(:,1),mat(:,2),mat(:,3),"Color",color);
plot3(mat(2,1),mat(2,2),mat(2,3),"r^","MarkerSize",20);
end
