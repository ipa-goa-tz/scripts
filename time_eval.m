%script evaluates merge performance under time aspect

%load data

octave_settings();
clear all;
name='polygon_ismergecandidate';
loadstr=['/home/goa-tz/eval/timing/',name];
data =load(loadstr);

%data =load('/home/goa-tz/eval/timing/cylinder_merge');
data=sortrows(data);
%assign columns to values

ns = data(:,1); % number of shapes
t= data(:,2); % time

n=size(t);


%make mean with respect to ns
j=1;
for i=1:1:n
    if i >1
        if ns(i)==ns(i-1)
            i_sum(j,2) =i_sum(j,2) + t(i);
            i_sum(j,3)=i_sum(j,3)+1;

        else    
            j=j+1;
            i_sum(j,2)=t(i);
            i_sum(j,1)=ns(i);
            i_sum(j,3)=1;
        end
    else
        i_sum(j,2)=t(i);
        i_sum(j,1)=ns(i);
        i_sum(j,3)=1;
    end
end

m=i_sum(:,2)./i_sum(:,3);

if size(m,1)>1
plot(i_sum(:,1),m)
plot_trace([i_sum(:,1),m*1000],'k','o','mergeTime in msec')
end
outputstr=['/share/goa-tz/evaluation_geometry_map/data/timing/',name];
header={'NumberOfShapes','AverageTime[msec]'};
data = [i_sum(:,1),m*1000];
file_output(outputstr,data,header,'txt',3)





