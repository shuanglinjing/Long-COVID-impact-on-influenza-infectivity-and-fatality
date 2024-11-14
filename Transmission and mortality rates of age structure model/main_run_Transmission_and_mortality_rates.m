clc
clear

Labels={'40','43','46','49','52','3','6','9','12','15'};


load('data16-17.mat','time','fx_beta1','fy_beta1','Mean_beta1','fx_beta2','fy_beta2','Mean_beta2',...
    'fx_beta3','fy_beta3','Mean_beta3','mu1','mu2','mu3');

fx_beta116_17=fx_beta1;
fx_beta216_17=fx_beta2;
fx_beta316_17=fx_beta3;
fy_beta116_17=fy_beta1;
fy_beta216_17=fy_beta2;
fy_beta316_17=fy_beta3;
Mean_beta116_17=Mean_beta1;
Mean_beta216_17=Mean_beta2;
Mean_beta316_17=Mean_beta3;
mu116_17=mu1;
mu216_17=mu2;
mu316_17=mu3;

load('data17-18.mat','fx_beta1','fy_beta1','Mean_beta1','fx_beta2','fy_beta2','Mean_beta2',...
    'fx_beta3','fy_beta3','Mean_beta3','mu1','mu2','mu3');

fx_beta117_18=fx_beta1;
fx_beta217_18=fx_beta2;
fx_beta317_18=fx_beta3;
fy_beta117_18=fy_beta1;
fy_beta217_18=fy_beta2;
fy_beta317_18=fy_beta3;
Mean_beta117_18=Mean_beta1;
Mean_beta217_18=Mean_beta2;
Mean_beta317_18=Mean_beta3;
mu117_18=mu1;
mu217_18=mu2;
mu317_18=mu3;

load('data18-19.mat','fx_beta1','fy_beta1','Mean_beta1','fx_beta2','fy_beta2','Mean_beta2',...
    'fx_beta3','fy_beta3','Mean_beta3','mu1','mu2','mu3');

fx_beta118_19=fx_beta1;
fx_beta218_19=fx_beta2;
fx_beta318_19=fx_beta3;
fy_beta118_19=fy_beta1;
fy_beta218_19=fy_beta2;
fy_beta318_19=fy_beta3;
Mean_beta118_19=Mean_beta1;
Mean_beta218_19=Mean_beta2;
Mean_beta318_19=Mean_beta3;
mu118_19=mu1;
mu218_19=mu2;
mu318_19=mu3;


% load('data21-22.mat','beta11','beta12','beta13','beta21','beta22','beta23','beta31',...
%     'beta32','beta33','mu1','mu2','mu3');
% 
% beta121_22=(mean(beta11)+mean(beta12)+mean(beta13))/3;
% beta221_22=(mean(beta21)+mean(beta22)+mean(beta23))/3;
% beta321_22=(mean(beta31)+mean(beta32)+mean(beta33))/3;
% mu121_22=mu1;
% mu221_22=mu2;
% mu321_22=mu3;

load('data22-23.mat','fx_beta1','fy_beta1','Mean_beta1','fx_beta2','fy_beta2','Mean_beta2',...
    'fx_beta3','fy_beta3','Mean_beta3','mu1','mu2','mu3');

fx_beta122_23=fx_beta1;
fx_beta222_23=fx_beta2;
fx_beta322_23=fx_beta3;
fy_beta122_23=fy_beta1;
fy_beta222_23=fy_beta2;
fy_beta322_23=fy_beta3;
Mean_beta122_23=Mean_beta1;
Mean_beta222_23=Mean_beta2;
Mean_beta322_23=Mean_beta3;
mu122_23=mu1;
mu222_23=mu2;
mu322_23=mu3;

load('data23-24.mat','fx_beta1','fy_beta1','Mean_beta1','fx_beta2','fy_beta2','Mean_beta2',...
    'fx_beta3','fy_beta3','Mean_beta3','mu1','mu2','mu3');

fx_beta123_24=fx_beta1;
fx_beta223_24=fx_beta2;
fx_beta323_24=fx_beta3;
fy_beta123_24=fy_beta1;
fy_beta223_24=fy_beta2;
fy_beta323_24=fy_beta3;
Mean_beta123_24=Mean_beta1;
Mean_beta223_24=Mean_beta2;
Mean_beta323_24=Mean_beta3;
mu123_24=mu1;
mu223_24=mu2;
mu323_24=mu3;

%% Simulation results
fig = figure(4);
[ha, pos] = tight_subplot(2,3,[.06 .08],[.055 .035],[.06 .02]);
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
plot(time,Mean_beta116_17,'r-','LineWidth',1.2)
hold on
plot(time,Mean_beta117_18,'b-','LineWidth',1.2)
hold on
plot(time,Mean_beta118_19,'color',[0.68 0.48 0.0275],'LineWidth',1.2)
hold on
% plot(time,beta121_22,'color',[0.624 0.0667 0.97],'LineWidth',1.2)
% hold on
plot(time,Mean_beta122_23,'color',[0 0.5 0],'LineWidth',1.2)
hold on
plot(time,Mean_beta123_24,'k-','LineWidth',1.2)
%xlabel('Time (weeks)','Interpreter','latex','FontSize',12)
ylabel('Transmission rate','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xtb = get(gca,'XTickLabel');% 获取横坐标轴标签句柄
xt = get(gca,'XTick');% 获取横坐标轴刻度句柄
yt = get(gca,'YTick'); % 获取纵坐标轴刻度句柄         
xtextp=xt;%每个标签放置位置的横坐标，这个自然应该和原来的一样了。                    
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');% 将原有的标签隐去
xlim([0.8 length(time)+0.2])
title('(A) 0-17 years old','Interpreter','latex','FontSize',12)
alpha(0.5);%透明度

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
plot(time,Mean_beta216_17,'r-','LineWidth',1.2)
hold on
plot(time,Mean_beta217_18,'b-','LineWidth',1.2)
hold on
plot(time,Mean_beta218_19,'color',[0.68 0.48 0.0275],'LineWidth',1.2)
hold on
% plot(time,beta221_22,'color',[0.624 0.0667 0.97],'LineWidth',1.2)
% hold on
plot(time,Mean_beta222_23,'color',[0 0.5 0],'LineWidth',1.2)
hold on
plot(time,Mean_beta223_24,'k-','LineWidth',1.2)
%xlabel('Time (weeks)','Interpreter','latex','FontSize',12)
ylabel('Transmission rate','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xtb = get(gca,'XTickLabel');% 获取横坐标轴标签句柄
xt = get(gca,'XTick');% 获取横坐标轴刻度句柄
yt = get(gca,'YTick'); % 获取纵坐标轴刻度句柄         
xtextp=xt;%每个标签放置位置的横坐标，这个自然应该和原来的一样了。                    
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');% 将原有的标签隐去
xlim([0.8 length(time)+0.2])
title('(B) 18-64 years old','Interpreter','latex','FontSize',12)
alpha(0.5);%透明度

axes(ha(3));
H_F1=fill(fx_beta316_17,fy_beta316_17,[1 0.6 0.8]);
set(H_F1,{'LineStyle'},{'none'});
hold on
H_F2=fill(fx_beta317_18,fy_beta317_18,[0.57 0.82 0.99]);
set(H_F2,{'LineStyle'},{'none'});
hold on
H_F3=fill(fx_beta318_19,fy_beta318_19,[0.99 0.88 0.62]);
set(H_F3,{'LineStyle'},{'none'});
hold on
% H_F4=fill(ERN_fx4,ERN_fy4,[0.89 0.75 0.98]);
% set(H_F4,{'LineStyle'},{'none'});
% hold on
H_F5=fill(fx_beta322_23,fy_beta322_23,[0.62 1 0.62]);
set(H_F5,{'LineStyle'},{'none'});
hold on
H_F6=fill(fx_beta323_24,fy_beta323_24,[0.8 0.8 0.8]);
set(H_F6,{'LineStyle'},{'none'});
hold on
h1=plot(time,Mean_beta316_17,'r-','LineWidth',1.2);
hold on
h2=plot(time,Mean_beta317_18,'b-','LineWidth',1.2);
hold on
h3=plot(time,Mean_beta318_19,'color',[0.68 0.48 0.0275],'LineWidth',1.2);
hold on
% plot(time,beta321_22,'color',[0.624 0.0667 0.97],'LineWidth',1.2);
% hold on
h5=plot(time,Mean_beta322_23,'color',[0 0.5 0],'LineWidth',1.2);
hold on
h6=plot(time,Mean_beta323_24,'k-','LineWidth',1.2);
%xlabel('Time (weeks)','Interpreter','latex','FontSize',12)
ylabel('Transmission rate','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xtb = get(gca,'XTickLabel');% 获取横坐标轴标签句柄
xt = get(gca,'XTick');% 获取横坐标轴刻度句柄
yt = get(gca,'YTick'); % 获取纵坐标轴刻度句柄         
xtextp=xt;%每个标签放置位置的横坐标，这个自然应该和原来的一样了。                    
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');% 将原有的标签隐去
xlim([0.8 length(time)+0.2])
h=legend([h1 h2 h3 h5 h6],'2016-2017','2017-2018','2018-2019','2022-2023','2023-2024', 'Color', 'none');
set(h,'box','off');
title('(C) 65+ years old','Interpreter','latex','FontSize',12)
alpha(0.5);%透明度

axes(ha(4));
plot(time,mu116_17,'r-','LineWidth',1.2)
hold on
plot(time,mu117_18,'b-','LineWidth',1.2)
hold on
plot(time,mu118_19,'color',[0.68 0.48 0.0275],'LineWidth',1.2)
hold on
% plot(time,mu121_22,'color',[0.624 0.0667 0.97],'LineWidth',1.2)
% hold on
plot(time,mu122_23,'color',[0 0.5 0],'LineWidth',1.2)
hold on
plot(time,mu123_24,'k-','LineWidth',1.2)
xlabel('Time (weeks)','Interpreter','latex','FontSize',12)
ylabel('Death rate','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xtb = get(gca,'XTickLabel');% 获取横坐标轴标签句柄
xt = get(gca,'XTick');% 获取横坐标轴刻度句柄
yt = get(gca,'YTick'); % 获取纵坐标轴刻度句柄         
xtextp=xt;%每个标签放置位置的横坐标，这个自然应该和原来的一样了。                    
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');% 将原有的标签隐去
xlim([0.8 length(time)+0.2])
title('(D) 0-17 years old','Interpreter','latex','FontSize',12)

axes(ha(5));
plot(time,mu216_17,'r-','LineWidth',1.2)
hold on
plot(time,mu217_18,'b-','LineWidth',1.2)
hold on
plot(time,mu218_19,'color',[0.68 0.48 0.0275],'LineWidth',1.2)
hold on
% plot(time,mu221_22,'color',[0.624 0.0667 0.97],'LineWidth',1.2)
% hold on
plot(time,mu222_23,'color',[0 0.5 0],'LineWidth',1.2)
hold on
plot(time,mu223_24,'k-','LineWidth',1.2)
xlabel('Time (weeks)','Interpreter','latex','FontSize',12)
ylabel('Death rate','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xtb = get(gca,'XTickLabel');% 获取横坐标轴标签句柄
xt = get(gca,'XTick');% 获取横坐标轴刻度句柄
yt = get(gca,'YTick'); % 获取纵坐标轴刻度句柄         
xtextp=xt;%每个标签放置位置的横坐标，这个自然应该和原来的一样了。                    
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');% 将原有的标签隐去
xlim([0.8 length(time)+0.2])
title('(E) 18-64 years old','Interpreter','latex','FontSize',12)

axes(ha(6));
plot(time,mu316_17,'r-','LineWidth',1.2)
hold on
plot(time,mu317_18,'b-','LineWidth',1.2)
hold on
plot(time,mu318_19,'color',[0.68 0.48 0.0275],'LineWidth',1.2)
hold on
% plot(time,mu321_22,'color',[0.624 0.0667 0.97],'LineWidth',1.2)
% hold on
plot(time,mu322_23,'color',[0 0.5 0],'LineWidth',1.2)
hold on
plot(time,mu323_24,'k-','LineWidth',1.2)
xlabel('Time (weeks)','Interpreter','latex','FontSize',12)
ylabel('Death rate','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xtb = get(gca,'XTickLabel');% 获取横坐标轴标签句柄
xt = get(gca,'XTick');% 获取横坐标轴刻度句柄
yt = get(gca,'YTick'); % 获取纵坐标轴刻度句柄         
xtextp=xt;%每个标签放置位置的横坐标，这个自然应该和原来的一样了。                    
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');% 将原有的标签隐去
xlim([0.8 length(time)+0.2])
h=legend('2016-2017','2017-2018','2018-2019','2022-2023','2023-2024', 'Color', 'none');
set(h,'box','off');
title('(F) 65+ years old','Interpreter','latex','FontSize',12)