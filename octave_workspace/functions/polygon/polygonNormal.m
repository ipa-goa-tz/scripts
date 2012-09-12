function normal=polygonNormal(polygon)

normal=vec_norm(cross(polygon.vertices(1,:),polygon.vertices(2,:)));



end
