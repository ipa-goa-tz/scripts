function sides=polygonSides(polygon)

b=sqrt(polygon.area/polygon.side_ratio);
a=b*polygon.side_ratio;

sides(1)=a;
sides(2)=b;

end
