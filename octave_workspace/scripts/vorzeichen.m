octave_settings()


data=load("/home/goa-tz/octave_workspace/data/axes");

plotAxes(0.02)

n= length(data);

j=1;
for i=1:2:n
centroid(j,:)=data(i,:);
origin(j,:)=data(i+1,:);
j=j+1;
end

n_half=length(centroid);

for i =1:1:n_half
diff = centroid(i,:) - origin(i,:);
if diff(2)< 0
diff = origin(i,:) - centroid(i,:);
end


plot3(diff','Color',rand(3,1))
diff_mat(i,:)=diff;
%plot3([0;0;0],diff','LineWidth',2,'Color',rand(3,1))
end


diff_mat
