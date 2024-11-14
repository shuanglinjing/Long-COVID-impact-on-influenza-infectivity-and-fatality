clc
clear

load data18-19;


Labels={'2018-40','2018-43','2018-46','2018-49','2018-52','2019-3',...
    '2019-6','2019-9','2019-12','2019-15'};

%% Simulation results
fig = figure(4);
[ha, pos] = tight_subplot(2,3,[.1 .12],[.07 .035],[.06 .06]);
left_color = [1 0 0];
right_color = [0 0 1];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
axes(ha(1));
yyaxis left;
H_F1=fill(fx1,fy1,[1 0.6 0.8]);
set(H_F1,{'LineStyle'},{'none'});
hold on
plot(data(:,1),data(:,2),'ks');
hold on
plot(time,Mean1,'r-','LineWidth',1.2)
%xlabel('Time (days)')
ylabel('New cases','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xtb = get(gca,'XTickLabel');
xt = get(gca,'XTick');
yt = get(gca,'YTick');        
xtextp=xt;                   
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');
xlim([0.5 length(time)+0.5])
yyaxis right;
H_F1=fill(fx_beta1,fy_beta1,[0.57 0.82 0.99]);
set(H_F1,{'LineStyle'},{'none'});
hold on
plot(time,Mean_beta1,'b','LineWidth',1.5)
ylabel('Transmission rate ($\frac{1}{3}\sum^{3}_{j=1}\beta_{1j}(t)$)','Interpreter','latex','FontSize',12)
xlim([0.5 length(time)+0.5])
title('(A) 0-17 years old','Interpreter','latex','FontSize',12)
alpha(0.5);

left_color = [1 0 0];
right_color = [0 0 1];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
axes(ha(2));
yyaxis left;
H_F1=fill(fx2,fy2,[1 0.6 0.8]);
set(H_F1,{'LineStyle'},{'none'});
hold on
plot(data(:,1),data(:,3),'ks');
hold on
plot(time,Mean2,'r-','LineWidth',1.2)
%xlabel('Time (days)')
ylabel('New cases','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xtb = get(gca,'XTickLabel');
xt = get(gca,'XTick');
yt = get(gca,'YTick');     
xtextp=xt;                  
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');
xlim([0.5 length(time)+0.5])
yyaxis right;
H_F1=fill(fx_beta2,fy_beta2,[0.57 0.82 0.99]);
set(H_F1,{'LineStyle'},{'none'});
hold on
plot(time,Mean_beta2,'b','LineWidth',1.5)
ylabel('Transmission rate ($\frac{1}{3}\sum^{3}_{j=1}\beta_{2j}(t)$)','Interpreter','latex','FontSize',12)
xlim([0.5 length(time)+0.5])
title('(B) 18-64 years old','Interpreter','latex','FontSize',12)
alpha(0.5);

left_color = [1 0 0];
right_color = [0 0 1];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
axes(ha(3));
yyaxis left;
H_F1=fill(fx3,fy3,[1 0.6 0.8]);
set(H_F1,{'LineStyle'},{'none'});
hold on
plot(data(:,1),data(:,4),'ks');
hold on
plot(time,Mean3,'r-','LineWidth',1.2)
%xlabel('Time (days)')
ylabel('New cases','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xtb = get(gca,'XTickLabel');
xt = get(gca,'XTick');
yt = get(gca,'YTick');  
xtextp=xt;                 
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');
xlim([0.5 length(time)+0.5])
yyaxis right;
H_F1=fill(fx_beta3,fy_beta3,[0.57 0.82 0.99]);
set(H_F1,{'LineStyle'},{'none'});
hold on
plot(time,Mean_beta3,'b','LineWidth',1.5)
ylabel('Transmission rate ($\frac{1}{3}\sum^{3}_{j=1}\beta_{3j}(t)$)','Interpreter','latex','FontSize',12)
xlim([0.5 length(time)+0.5])
h=legend('95% CI','New cases','Estimated cases','95% CI','Transmission rate', 'Color', 'none');
set(h,'box','off');
title('(C) 65+ years old','Interpreter','latex','FontSize',12)
alpha(0.5);


left_color = [1 0 0];
right_color = [0 0 1];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
axes(ha(4));
yyaxis left;
H_F1=fill(fx4,fy4,[1 0.6 0.8]);
set(H_F1,{'LineStyle'},{'none'});
hold on
plot(data(:,1),data(:,5),'ks');
hold on
plot(time,Mean4,'r-','LineWidth',1.2)
%xlabel('Time (days)')
ylabel('New deaths','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xtb = get(gca,'XTickLabel');
xt = get(gca,'XTick');
yt = get(gca,'YTick');    
xtextp=xt;               
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');
xlim([0.5 length(time)+0.5])
yyaxis right;
plot(time,mu1,'b','LineWidth',1.5)
ylabel('Death rate ($\gamma_{1}\mu_{1}(t)$)','Interpreter','latex','FontSize',12)
xlim([0.5 length(time)+0.5])
title('(D) 0-17 years old','Interpreter','latex','FontSize',12)
alpha(0.5);

left_color = [1 0 0];
right_color = [0 0 1];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
axes(ha(5));
yyaxis left;
H_F1=fill(fx5,fy5,[1 0.6 0.8]);
set(H_F1,{'LineStyle'},{'none'});
hold on
plot(data(:,1),data(:,6),'ks');
hold on
plot(time,Mean5,'r-','LineWidth',1.2)
%xlabel('Time (days)')
ylabel('New deaths','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xtb = get(gca,'XTickLabel');
xt = get(gca,'XTick');
yt = get(gca,'YTick');
xtextp=xt;                 
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');
xlim([0.5 length(time)+0.5])
yyaxis right;
plot(time,mu2,'b','LineWidth',1.5)
ylabel('Death rate ($\gamma_{2}\mu_{2}(t)$)','Interpreter','latex','FontSize',12)
xlim([0.5 length(time)+0.5])
title('(E) 18-64 years old','Interpreter','latex','FontSize',12)
alpha(0.5);

left_color = [1 0 0];
right_color = [0 0 1];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
axes(ha(6));
yyaxis left;
H_F1=fill(fx6,fy6,[1 0.6 0.8]);
set(H_F1,{'LineStyle'},{'none'});
hold on
plot(data(:,1),data(:,7),'ks');
hold on
plot(time,Mean6,'r-','LineWidth',1.2)
%xlabel('Time (days)')
ylabel('New deaths','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',Labels);
xtb = get(gca,'XTickLabel');
xt = get(gca,'XTick');
yt = get(gca,'YTick');       
xtextp=xt;                 
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');
xlim([0.5 length(time)+0.5])
yyaxis right;
plot(time,mu3,'b','LineWidth',1.5)
ylabel('Death rate ($\gamma_{3}\mu_{3}(t)$)','Interpreter','latex','FontSize',12)
xlim([0.5 length(time)+0.5])
h=legend('95% CI','New deaths','Estimated cases','Death rate', 'Color', 'none');
set(h,'box','off');
title('(F) 65+ years old','Interpreter','latex','FontSize',12)
alpha(0.5);