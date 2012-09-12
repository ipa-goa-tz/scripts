function    stats(data,title)

mode_display=false;
mode_file=true;


m=size(data,2);
%s=zeros(1,m);
%m=zeros(1,m);
%med=zeros(1,m);

for i=1:1:m
    s(i,1)=std(data(:,i)');
    m(i,1)=mean(data(:,i)');
    med(i,1)=median(data(:,i)');



end
if mode_display==true
%display print
fprintf('__________________________\n');
fprintf('Statistics for %s\n',title);
fprintf('std. dev= %f\n',s);
fprintf('mean= %f\n',m);
fprintf('median= %f\n',med);

fprintf('__________________________\n');
end

if mode_file==true
file=[title,'_stats'];
header={'mean','std dev.','median'};
data=[m,s,med];
file_output(file,data,header,'txt','3');
end


end
