function cylinder2MapEntry(c,fmode)
	o_path="../data/cylinder_entry.txt";


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
fprintf(fid,"//Cylinder ,c.id%i\n",c.id)

fprintf(fid,"CylinderPtr  c%i  =CylinderPtr(new Cylinder()); \n",c.id);
fprintf(fid,"c%i->id = %i; \n",c.id, c.id);

fprintf(fid,"Eigen::Vector3f x_axis%i,y_axis%i,z_axis%i; \n" ,c.id ,c.id ,c.id) ;
fprintf(fid,"std::vector<Eigen::Vector3f> axes%i; \n",c.id);
fprintf(fid,"Eigen::Vector3f origin%i; \n" ,c.id );
fprintf(fid," std::vector<Eigen::Vector3f> contour%i; \n" ,c.id );
fprintf(fid," Eigen::Vector3f v%i; \n" ,c.id );


fprintf(fid,"x_axis%i << %d,%d,%d; \n" ,c.id, c.axes(:,1));
fprintf(fid,"axes%i.push_back(x_axis%i); \n" ,c.id ,c.id);


fprintf(fid,"y_axis%i << %d,%d,%d; \n" ,c.id, c.axes(:,2) );
fprintf(fid,"axes%i.push_back(y_axis%i); \n" ,c.id ,c.id );

fprintf(fid,"z_axis%i << %d,%d,%d; \n" ,c.id , c.axes(:,3));
fprintf(fid,"axes%i.push_back(z_axis%i); \n",c.id ,c.id );

fprintf(fid,"c%i->axes_=axes%i; \n",c.id ,c.id );


for i=1:1:c.numVertices
 fprintf(fid,"v%i << %f, %f, %f; \n",c.id, c.vertices(i,1),c.vertices(i,2),c.vertices(i,3));
 fprintf(fid,"contour%i.push_back(v%i); \n",c.id , c.id);
end
 fprintf(fid,"c%i->contours.push_back(contour%i); \n",c.id , c.id);

fprintf(fid,"c%i->merged=1; \n" ,c.id );
fprintf(fid," origin%i << %d,%d,%d; \n" ,c.id ,c.origin);
fprintf(fid," c%i->origin_=origin%i; \n" ,c.id ,c.id );

fprintf(fid," c%i->r_=%d; \n" ,c.id, c.r );



 fprintf(fid,"c%i->holes.push_back(0); \n" ,c.id );
 fprintf(fid,"c%i->debug_=false; \n" ,c.id );

fclose(fid);
