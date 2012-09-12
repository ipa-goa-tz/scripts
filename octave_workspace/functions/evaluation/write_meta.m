function write_meta(scenario,path)


t=clock();
date_str=[date,'-',num2str(t(4)),'-',num2str(t(5))];
file=[path,scenario,'_info']
fid=fopen(file,'w');
fprintf(fid,'///////////// Scenario Information/////////////////\n')
fprintf(fid,'Bagfile Name:\n');
fprintf(fid,'%s \n',scenario);
fprintf(fid,'Date of Recording:\n\n');

fprintf(fid,'Date of Evaluation:\n');
fprintf(fid,'%s \n',date_str);

fprintf(fid,'Scenario Details:\n');

fclose(fid);

