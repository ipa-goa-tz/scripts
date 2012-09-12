function    file_output(file,data,header,type,precision)
%Function File:  file_output(file,data,header,type
%    -file................... output file path
%    -data .................. matrix, that contains output data
%    -header ................ headings of the data columns
%    -type .................. output filetype (tex,txt)
%    -precision.............. number of leading zeros in output file

format_list={'tex'};




if size(data,2)!=size(header,2)
    fprintf('ERROR: Use columnwise data - provide header entry for every column.\n')
    size(data)
    size(header)
   return
end


if strcmp(type,'tex')==true
dels={' & ',' \\\\ \n'};
%fprintf('Creating LaTex file format.\n');
file=[file,'.tex'];
%fprintf('Filename : %s\n',file);

elseif strcmp(type,'txt')==true
dels={'\t','\n'};
%fprintf('Creating LaTex file format.\n');
file=[file,'.txt'];
%fprintf('Filename : %s\n',file);

else
    fprintf('ERROR:File format not implemented\n');
    fprintf('Format List: %s\n',format_list);
end    

precisionstr=['%.',num2str(precision),'f'];


% print header
fid=fopen(file,'w');
for i = 1:1:size(header,2)
fprintf(fid,'%s',header{i})
if i <size(header,2)
fprintf(fid, dels{1});
end
end
fprintf(fid,dels{2});
fclose(fid);

%print data
dlmwrite(file,data,dels{1},'newline',dels{2},'precision',precisionstr,"-append")



