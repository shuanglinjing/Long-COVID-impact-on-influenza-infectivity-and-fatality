clc
clear
time1=1:30;
time2=1:31;
Labels={'40','42','44','46','48','50','52','2','4','6','8','10','12','14','16'};

load Re_AS.mat
fig = figure(1);
[ha, pos] = tight_subplot(2,1,[.09 .08],[.085 .04],[.095 .02]);
axes(ha(1));
H_F1=fill(ERN_fx1,ERN_fy1,[1 0.6 0.8]);
set(H_F1,{'LineStyle'},{'none'});
hold on
H_F2=fill(ERN_fx2,ERN_fy2,[0.57 0.82 0.99]);
set(H_F2,{'LineStyle'},{'none'});
hold on
H_F3=fill(ERN_fx3,ERN_fy3,[0.99 0.88 0.62]);
set(H_F3,{'LineStyle'},{'none'});
hold on
% H_F4=fill(ERN_fx4,ERN_fy4,[0.89 0.75 0.98]);
% set(H_F4,{'LineStyle'},{'none'});
% hold on
H_F5=fill(ERN_fx5,ERN_fy5,[0.62 1 0.62]);
set(H_F5,{'LineStyle'},{'none'});
hold on
H_F6=fill(ERN_fx6,ERN_fy6,[0.8 0.8 0.8]);
set(H_F6,{'LineStyle'},{'none'});
hold on
h1=plot(time1,ERN_Mean1,'r-','LineWidth',1.2);
hold on
h2=plot(time1,ERN_Mean2,'b-','LineWidth',1.2);
hold on
h3=plot(time1,ERN_Mean3,'color',[0.68 0.48 0.0275],'LineWidth',1.2);
hold on
% h4=plot(time,ERN_Mean4,'color',[0.624 0.0667 0.97],'LineWidth',1.2);
% hold on
h5=plot(time1,ERN_Mean5,'color',[0 0.5 0],'LineWidth',1.2);
hold on
h6=plot(time1,ERN_Mean6,'k-','LineWidth',1.2);
%xlabel('Time (weeks)','Interpreter','latex','FontSize',12)
ylabel('Effective reproduction number ($\mathcal{R}^{AS}_{e}(t)$)','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     3     5     7     9    11    13    15    17    19    21    23    25    27    29]);
set(gca,'xticklabel',Labels);
xlim([0.9 length(time1)+0.1])
h=legend([h1 h2 h3 h5 h6],'2016-2017','2017-2018','2018-2019','2022-2023','2023-2024', 'Color', 'none');
set(h,'box','off');
alpha(0.5);
ylim([0,2])
title('(A) Age-structured Model','Interpreter','latex','FontSize',12)

load Re_MS.mat
axes(ha(2));
H_F1=fill(ERN_fx1,ERN_fy1,[1 0.6 0.8]);
set(H_F1,{'LineStyle'},{'none'});
hold on
H_F2=fill(ERN_fx2,ERN_fy2,[0.57 0.82 0.99]);
set(H_F2,{'LineStyle'},{'none'});
hold on
H_F3=fill(ERN_fx3,ERN_fy3,[0.99 0.88 0.62]);
set(H_F3,{'LineStyle'},{'none'});
hold on
% H_F4=fill(ERN_fx4,ERN_fy4,[0.89 0.75 0.98]);
% set(H_F4,{'LineStyle'},{'none'});
% hold on
H_F5=fill(ERN_fx5,ERN_fy5,[0.62 1 0.62]);
set(H_F5,{'LineStyle'},{'none'});
hold on
H_F6=fill(ERN_fx6,ERN_fy6,[0.8 0.8 0.8]);
set(H_F6,{'LineStyle'},{'none'});
hold on
h1=plot(time1,ERN_Mean1,'r-','LineWidth',1.2);
hold on
h2=plot(time1,ERN_Mean2,'b-','LineWidth',1.2);
hold on
h3=plot(time2,ERN_Mean3,'color',[0.68 0.48 0.0275],'LineWidth',1.2);
hold on
% h4=plot(time,ERN_Mean4,'color',[0.624 0.0667 0.97],'LineWidth',1.2);
% hold on
h5=plot(time1,ERN_Mean5,'color',[0 0.5 0],'LineWidth',1.2);
hold on
h6=plot(time1,ERN_Mean6,'k-','LineWidth',1.2);
xlabel('Time (weeks)','Interpreter','latex','FontSize',12)
ylabel('Effective reproduction number ($\mathcal{R}^{MS}_{e}(t)$)','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     3     5     7     9    11    13    15    17    19    21    23    25    27    29]);
set(gca,'xticklabel',Labels);
xlim([0.9 length(time1)+0.1])
h=legend([h1 h2 h3 h5 h6],'2016-2017','2017-2018','2018-2019','2022-2023','2023-2024', 'Color', 'none');
set(h,'box','off');
alpha(0.5);
ylim([0,2])
title('(B) Multi-strain Model','Interpreter','latex','FontSize',12)

%print(['fig_Re','.eps'],'-depsc','-r300');