function  plot_subs(x,y,mapping,colors,legend,title_str)

%--Function File
%
%x:      - contains data printed on x axis,for n epochs -  nx1
%
%y:      - contains data y(x), nxm
%            
%NOT IMPLEMENTED-------------------------
%mapping:
%        - contains the description of the data in y.
%
%        mapping = [colA,colB,colC,...]
%        first  column  of data A in y is colA
%        first column of data B in y is colB
%-----------------------------------------
%extras :
%        extras = [[lA,lB,lC,...],[cA,cB,cC,..],[tA,tB,tC,...]]
%        - legend strings:   lA,...
%        - color strings:    cA,...
%        - title strins:     tA,...






%calculate y axis limits
max_y=max(max(y));
min_y=min(min(y));



gcf();
grid on;
num_axes=size(mapping,2);
num_lines_all=size(y,2);

for axis=1:1:num_axes

    if axis==num_axes
        num_lines=num_lines_all -mapping(axis) + 1;
    else    
    num_lines=(mapping(axis+1)-mapping(axis));
    end

    for line=mapping(axis):1:mapping(axis)+num_lines-1
       
        str=[colors{line},' ; ',legend{line},' ; '];
       
        subplot(num_axes,1,axis),plot(x,y(:,line),str);
        hold on;
    end
    xlabel('t in frames');
    ylabel('mm');
%   set(gca(),"ylim",[min_y,max_y]);
end

ax = axes;
set(ax, 'visible', 'off')
title(title_str);                         
