function offset = get_txt_offset(point)


offset = zeros(1,length(point));

for i=1:1:length(point)
offset(i) = 3*point(i)/1000;
end

end
