

close all;
clear all;
clc
vector_a=[0.0537 -0.0157 -0.9984];
vector_b=[0.08701 -0.05464 -0.9947];
vector_c=[-0.1345 0.0863 -0.98713];
vector_d=[-0.0764 0.0519 -0.9957];

origin = [0 0 0];

% write the vectors you want to visualize in this matrix (as rows)
vectors=[vector_a;vector_b;vector_c;vector_d];
vector_names={'a','b','c','d'};

hold on

for i=1:1:size(vectors,1)
color=rand(3,1);
mat = [origin;vectors(i,:)];
plot3(mat(:,1),mat(:,2),mat(:,3),"Color",color);
plot3(mat(2,1),mat(2,2),mat(2,3),"r^","MarkerSize",20);
text(mat(2,1),mat(2,2),mat(2,3),vector_names{i});
end
