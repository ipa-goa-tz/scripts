function polygon2MapEntry(p,fmode)
	o_path="../data/polygon_entry.txt";


%-----------------------------------------------
	if(strcmp(fmode,"new")==1)
			fid=fopen(o_path,'w');
			fprintf(fid,"Eigen::Vector3f v;\n");
			fprintf(fid,"std::vector<Eigen::Vector3f> vv;\n");
	end

	if(strcmp(fmode,"add")==1)				
			fid=fopen(o_path,'a');
			fprintf(fid,"\n\n")
			fprintf(fid,"vv.clear();\n");
	end
%-----------------------------------------------
		
	fprintf(fid,"PolygonPtr m_p%i = PolygonPtr(new Polygon());\n",p.id);
	fprintf(fid,"m_p%i->id = %i;\n",p.id,p.id);

	fprintf(fid,"m_p%i->normal << %f,%f,%f;\n",p.id,p.normal(1),p.normal(2),p.normal(3));
	fprintf(fid,"m_p%i->d = %d;\n",p.id,p.d);

for i=1:1:(p.num_vertices)

	fprintf(fid,"v << %f,%f,%f;\n",p.vertices(i,1),p.vertices(i,2),p.vertices(i,3));
	fprintf(fid,"vv.push_back(v);\n");
end
	fprintf(fid,"m_p%i->contours.push_back(vv);\n",p.id);
	fprintf(fid,"m_p%i->holes.push_back(0);\n",p.id);
	fprintf(fid,"gm.addMapEntry(m_p%i);\n",p.id);

fclose(fid);
