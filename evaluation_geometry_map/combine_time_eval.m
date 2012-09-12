#!/usr/bin/env octave 


octave_settings();

name=argv(){1}
subf={'001_2','050_2','100_2','150_2','200_2','250','300','350','400','450','500'};
outputstr=['/share/goa-tz/evaluation_geometry_map/data/timing/combined/',name];
for i=1:1:length(subf)
loadstr=['/share/goa-tz/evaluation_geometry_map/data/timing/',subf{i},'/',name,'.txt'];
    temp = dlmread(loadstr,"\t",1,0);

data(:,i)=temp(:,2);
end

plot([0:50:500],data,'ro')
hold on;
plot([0:50:500],data)
hold on;
%figure(1)
%plot_trace([[0:50:500],data],'r','o',name);
%gcf()
print('-dpdf',[outputstr,'.pdf'])

header={'Mapsize','time in [msec]'};
file_output(outputstr,[[0:50:500]',data'],header,'txt',3)
