function  plot_trace(mat,color,marker,name)
%
%--function: plot_trace(mat,color,marker,name)
%
% plots trace of data in mat (2D,3D) with attributes,
% specified in color,marker. A legend entry is created
% using the name attribute.
%
%
%
%
%plots trace - that looks like this
%
%                  3       4
%              ----*-------*
% 1        2   |
%-*--------*-- |
%
%
%------------------------------------------
%goa-tz  - 2012/08/21

gcf();
o = get_txt_offset(mat(1,:));


c=color;
cm=strcat(color,marker);
cl=[color,' ; ',name,' ; '];

%cml=strcat(cm,legend)

if(size(mat,2) ==3)

 
    plot3(mat(:,1),mat(:,2),mat(:,3),cl)

    hold on
    for i=1:1:size(mat,1)
        plot3(mat(i,1),mat(i,2),mat(i,3),cm)
        text(mat(i,1)+o(1),mat(i,2)+o(2),mat(i,3)+o(3),num2str(i),'Color',c);
    end
end



if(size(mat,2)==2)
     plot(mat(:,1),mat(:,2),cl)

    hold on
    for i=1:1:size(mat,1)
        plot(mat(i,1),mat(i,2),cm)
        text(mat(i,1)+o(1),mat(i,2)+o(2),num2str(i),'Color',c);
    end   


end



