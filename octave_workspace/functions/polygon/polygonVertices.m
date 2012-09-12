function verts=polygonVertices(polygon,axes)
%function creates polygon vertices. only implemented for rectangle

a=polygon.sides(1);
b=polygon.sides(2);

o=polygon.centroid';

coord_vec=[(o+axes.x*a/2)(1),(o+axes.z*b/2)(3),(o-axes.x*a/2)(1),(o-axes.z*b/2)(3)];

verts(1,:)= [coord_vec(1), 0 ,coord_vec(2)];
verts(2,:)= [coord_vec(1), 0 ,coord_vec(4)];
verts(3,:)= [coord_vec(3), 0 ,coord_vec(4)];
verts(4,:)= [coord_vec(3), 0 ,coord_vec(2)];

end
