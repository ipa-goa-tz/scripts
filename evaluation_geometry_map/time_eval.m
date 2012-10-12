#!/usr/bin/env octave
%script evaluates merge performance under time aspect

%load data

octave_settings();
clear all;

set(0, 'defaultfigurevisible', 'off'); 

subf=argv(){1}
name=argv(){2}
loadstr=['/home/goa-tz/eval/timing/',subf,'/',name];
mkdir('/share/goa-tz/evaluation_geometry_map/data/timing/',subf);
outputstr=['/share/goa-tz/evaluation_geometry_map/data/timing/',subf,'/',name];

mode=1;
filter = 1;

data =load(loadstr);

%plot([1:1:length(data)],data(:,2));
%print('dpdf',[outputstr,'_raw.pdf']);

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

if mode ==1
 % when only last number of shapes is to be evaluate   
indices=find(ns==ns(end));
relevant_raw = t(indices);
plot([1:1:length(relevant_raw)],relevant_raw)
hold on
plot([1:1:length(relevant_raw)],relevant_raw,'ro')
print('-dpdf',[outputstr,'_sel.pdf'])
std_dev=std(relevant_raw);
indices_blunder =find((relevant_raw-mean(relevant_raw))>2*std_dev)
 relevant_filter=relevant_raw;
 length(relevant_filter);
relevant_filter(indices_blunder)=[];
length(relevant_filter);
if filter==1
    m = sum(relevant_filter)/length(relevant_filter);
    figure()
    plot([1:1:length(relevant_filter)],relevant_filter)
    hold on
    plot([1:1:length(relevant_filter)],relevant_filter,'ro')
    print('-dpdf',[outputstr,'_filter.pdf'])
else    
    m = sum(relevant_raw)/length(relevant_raw);
end
i_sum=ns(end);

end

if size(m,1)>1
plot(i_sum(:,1),m);
plot_trace([i_sum(:,1),m*1000],'k','o','mergeTime in msec');
end
header={'NumberOfShapes','AverageTime[msec]'};
data = [i_sum(:,1),m*1000];
file_output(outputstr,data,header,'txt',3)






