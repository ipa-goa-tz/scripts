function vertices=polygonVertexList(list)

v=1;
for i=1:3:numel(list)

	vertices(v,1)=list(i);
	vertices(v,2)=list(i+1);
	vertices(v,3)=list(i+2);
	
	v=v+1;
end


end
