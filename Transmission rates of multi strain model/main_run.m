clc
clear

load data16-17;

Labels={'2016-40','2016-43','2016-46','2016-49','2016-52','2017-3',...
    '2017-6','2017-9','2017-12','2017-15'};

%% Simulation results
fig = figure(4);
[ha, pos] = tight_subplot(1,2,[.09 .15],[.12 .05],[.08 .07]);
left_color = [1 0 0];
right_color = [0 0 1];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
axes(ha(1));
yyaxis left;
H_F1=fill(fx1,fy1,[1 0.6 0.8]);
set(H_F1,{'LineStyle'},{'none'});
hold on
plot(Data1(:,1),Data1(:,2),'ks');
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
ylabel('Transmission rate ($\beta_{1}(t))$','Interpreter','latex','FontSize',12)
xlim([0.8 length(time)+0.2])
ylim([0,3.5])
h=legend('95% CI','New cases','Estimated cases','95% CI','Transmission rate', 'Color', 'none');
set(h,'box','off');
alpha(0.5);
title('(A) Influenza B','Interpreter','latex','FontSize',12)

left_color = [1 0 0];
right_color = [0 0 1];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
axes(ha(2));
yyaxis left;
H_F1=fill(fx2,fy2,[1 0.6 0.8]);
set(H_F1,{'LineStyle'},{'none'});
hold on
plot(Data1(:,1),Data1(:,3),'ks');
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
ylabel('Transmission rate ($\beta_{2}(t))$','Interpreter','latex','FontSize',12)
xlim([0.8 length(time)+0.2])
ylim([0,3.5])
alpha(0.5);
title('(B) Influenza B','Interpreter','latex','FontSize',12)

%print(['fig16_17_MS','.eps'],'-depsc','-r600');
