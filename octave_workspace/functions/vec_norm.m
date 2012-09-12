function mat_normalized=vec_norm(mat,dim)
    
    if dim == 1
        len = size(mat,2);
    end
    if dim == 2
        len = size(mat,1);
    end    


    for i=1:1:len
        if dim ==1
            vec = mat(:,i);
        end
        if dim ==2
            vec = mat(i,:);
        end
            
	vec_normalized=vec./norm(vec);

    if dim ==1
        mat_normalized(:,i)=vec_normalized;
    end
    if dim == 2
        mat_normalized(i,:)=vec_normalized;
    end        
end
