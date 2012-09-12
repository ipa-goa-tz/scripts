function p_out=polygonShift(p_in,shift)
	
p_out=p_in;

for i=1:1:p_in.num_vertices

	p_out.vertices(i,:)=p_in.vertices(i,:)+shift;
end

	p_out.centroid=p_in.centroid +shift';
	p_out.d=polygonDistance(p_out);

end
