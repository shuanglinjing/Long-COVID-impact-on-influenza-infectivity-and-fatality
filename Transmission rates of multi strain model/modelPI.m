function [py,px]= modelPI(Time,XX)
%% Prediction Interval


Mean=XX.obslims{1, 1}{1, 1}(2,:);
meanci=XX.obslims{1, 1}{1, 1}([1,3],:);

f=zeros(length(Mean),2);
i=1;
for t = 1:1:length(Time)
f(i,1)=max([meanci(1,i),meanci(2,i)]); 
f(i,2)=min([meanci(1,i),meanci(2,i)]);
i=i+1;
end
t = 1:1:length(Time);
py=cat(2,f(:,1)',flipdim(f(:,2),1)')';
px=cat(2,t,flipdim(t',1)')';