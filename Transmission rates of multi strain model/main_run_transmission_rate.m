clc
clear

Labels={'40','43','46','49','52','3','6','9','12','15'};

load('data16-17.mat','time','fx_beta1','fy_beta1','Mean_beta1','fx_beta2','fy_beta2','Mean_beta2');
time1=time;
fx_beta116_17=fx_beta1;
fx_beta216_17=fx_beta2;
fy_beta116_17=fy_beta1;
fy_beta216_17=fy_beta2;
Mean_beta116_17=Mean_beta1;
Mean_beta216_17=Mean_beta2;


load('data17-18.mat','fx_beta1','fy_beta1','Mean_beta1','fx_beta2','fy_beta2','Mean_beta2');
fx_beta117_18=fx_beta1;
fx_beta217_18=fx_beta2;
fy_beta117_18=fy_beta1;
fy_beta217_18=fy_beta2;
Mean_beta117_18=Mean_beta1;
Mean_beta217_18=Mean_beta2;

load('data18-19.mat','time','fx_beta1','fy_beta1','Mean_beta1','fx_beta2','fy_beta2','Mean_beta2');
time2=time;
fx_beta118_19=fx_beta1;
fx_beta218_19=fx_beta2;
fy_beta118_19=fy_beta1;
fy_beta218_19=fy_beta2;
Mean_beta118_19=Mean_beta1;
Mean_beta218_19=Mean_beta2;


% load('data21-22.mat','beta11','beta12','beta13','beta21','beta22','beta23','beta31',...
%     'beta32','beta33','mu1','mu2','mu3');
% 
% beta121_22=(mean(beta11)+mean(beta12)+mean(beta13))/3;
% beta221_22=(mean(beta21)+mean(beta22)+mean(beta23))/3;
% beta321_22=(mean(beta31)+mean(beta32)+mean(beta33))/3;
% mu121_22=mu1;
% mu221_22=mu2;
% mu321_22=mu3;

load('data22-23.mat','fx_beta1','fy_beta1','Mean_beta1','fx_beta2','fy_beta2','Mean_beta2');
fx_beta122_23=fx_beta1;
fx_beta222_23=fx_beta2;
fy_beta122_23=fy_beta1;
fy_beta222_23=fy_beta2;
Mean_beta122_23=Mean_beta1;
Mean_beta222_23=Mean_beta2;

load('data23-24.mat','fx_beta1','fy_beta1','Mean_beta1','fx_beta2','fy_beta2','Mean_beta2');
fx_beta123_24=fx_beta1;
fx_beta223_24=fx_beta2;
fy_beta123_24=fy_beta1;
fy_beta223_24=fy_beta2;
Mean_beta123_24=Mean_beta1;
Mean_beta223_24=Mean_beta2;

%% Simulation results
fig = figure(4);
[ha, pos] = tight_subplot(1,2,[.1 .08],[.12 .06],[.06 .02]);
axes(ha(1));
H_F1=fill(fx_beta116_17,fy_beta116_17,[1 0.6 0.8]);
set(H_F1,{'LineStyle'},{'none'});
hold on
H_F2=fill(fx_beta117_18,fy_beta117_18,[0.57 0.82 0.99]);
set(H_F2,{'LineStyle'},{'none'});
hold on
H_F3=fill(fx_beta118_19,fy_beta118_19,[0.99 0.88 0.62]);
set(H_F3,{'LineStyle'},{'none'});
hold on
% H_F4=fill(ERN_fx4,ERN_fy4,[0.89 0.75 0.98]);
% set(H_F4,{'LineStyle'},{'none'});
% hold on
H_F5=fill(fx_beta122_23,fy_beta122_23,[0.62 1 0.62]);
set(H_F5,{'LineStyle'},{'none'});
hold on
H_F6=fill(fx_beta123_24,fy_beta123_24,[0.8 0.8 0.8]);
set(H_F6,{'LineStyle'},{'none'});
hold on
plot(time1,Mean_beta116_17,'r-','LineWidth',1.2)
hold on
plot(time1,Mean_beta117_18,'b-','LineWidth',1.2)
hold on
plot(time2,Mean_beta118_19,'color',[0.68 0.48 0.0275],'LineWidth',1.2)
hold on
% plot(time,beta121_22,'color',[0.624 0.0667 0.97],'LineWidth',1.2)
% hold on
plot(time1,Mean_beta122_23,'color',[0 0.5 0],'LineWidth',1.2)
hold on
plot(time1,Mean_beta123_24,'k-','LineWidth',1.2)
xlabel('Time (weeks)','Interpreter','latex','FontSize',12)
ylabel('Transmission rate','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xlim([0.8 length(time1)+0.2])
title('(A) Influenza A','Interpreter','latex','FontSize',12)
ylim([0 4.5])
alpha(0.5);

axes(ha(2));
H_F1=fill(fx_beta216_17,fy_beta216_17,[1 0.6 0.8]);
set(H_F1,{'LineStyle'},{'none'});
hold on
H_F2=fill(fx_beta217_18,fy_beta217_18,[0.57 0.82 0.99]);
set(H_F2,{'LineStyle'},{'none'});
hold on
H_F3=fill(fx_beta218_19,fy_beta218_19,[0.99 0.88 0.62]);
set(H_F3,{'LineStyle'},{'none'});
hold on
% H_F4=fill(ERN_fx4,ERN_fy4,[0.89 0.75 0.98]);
% set(H_F4,{'LineStyle'},{'none'});
% hold on
H_F5=fill(fx_beta222_23,fy_beta222_23,[0.62 1 0.62]);
set(H_F5,{'LineStyle'},{'none'});
hold on
H_F6=fill(fx_beta223_24,fy_beta223_24,[0.8 0.8 0.8]);
set(H_F6,{'LineStyle'},{'none'});
hold on
h1=plot(time1,Mean_beta216_17,'r-','LineWidth',1.2);
hold on
h2=plot(time1,Mean_beta217_18,'b-','LineWidth',1.2);
hold on
h3=plot(time2,Mean_beta218_19,'color',[0.68 0.48 0.0275],'LineWidth',1.2);
hold on
% plot(time,beta221_22,'color',[0.624 0.0667 0.97],'LineWidth',1.2);
% hold on
h5=plot(time1,Mean_beta222_23,'color',[0 0.5 0],'LineWidth',1.2);
hold on
h6=plot(time1,Mean_beta223_24,'k-','LineWidth',1.2);
xlabel('Time (weeks)','Interpreter','latex','FontSize',12)
ylabel('Transmission rate','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xlim([0.8 length(time1)+0.2])
h=legend([h1 h2 h3 h5 h6],'2016-2017','2017-2018','2018-2019','2022-2023','2023-2024', 'Color', 'none');
set(h,'box','off');
title('(B) Influenza B','Interpreter','latex','FontSize',12)
ylim([0 4.5])
alpha(0.5);
