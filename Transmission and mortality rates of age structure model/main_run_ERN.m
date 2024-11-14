clc
clear

Labels={'40','42','44','46','48','50','52','2','4','6','8','10','12','14','16'};

load data16-17;
%% effective reproduction number
for j=1:length(K) 
    [t,y] = ode15s(@Model_Flu_ode,time,y0,[],beta11(j,:)',beta12(j,:)',...
        beta13(j,:)',beta21(j,:)',beta22(j,:)',beta23(j,:)',beta31(j,:)',beta32(j,:)',beta33(j,:)',Data1(:,5:7));
    S1=y(:,1);S2=y(:,2);S3=y(:,3);
    E1=y(:,4);E2=y(:,5);E3=y(:,6);
    I1=y(:,7);I2=y(:,8);I3=y(:,9);
    R1=y(:,10);R2=y(:,11);R3=y(:,12);
    N1=(S1+E1+I1+R1);N2=(S2+E2+I2+R2);N3=(S3+E3+I3+R3);
    for i=1:length(time)
        ERN1=effective_reproduction_number(beta11(j,i),beta12(j,i),beta13(j,i),...
            beta21(j,i),beta22(j,i),beta23(j,i),beta31(j,i),beta32(j,i),beta33(j,i),...
            S1(i),S2(i),S3(i),N1(i),N2(i),N3(i));
        ERN_Flu1(j,i)=ERN1; %effective reproduction number
    end
end



load data17-18;
%% effective reproduction number
for j=1:length(K) 
    [t,y] = ode15s(@Model_Flu_ode,time,y0,[],beta11(j,:)',beta12(j,:)',...
        beta13(j,:)',beta21(j,:)',beta22(j,:)',beta23(j,:)',beta31(j,:)',beta32(j,:)',beta33(j,:)',Data1(:,5:7));
    S1=y(:,1);S2=y(:,2);S3=y(:,3);
    E1=y(:,4);E2=y(:,5);E3=y(:,6);
    I1=y(:,7);I2=y(:,8);I3=y(:,9);
    R1=y(:,10);R2=y(:,11);R3=y(:,12);
    N1=(S1+E1+I1+R1);N2=(S2+E2+I2+R2);N3=(S3+E3+I3+R3);
    for i=1:length(time)
        ERN2=effective_reproduction_number(beta11(j,i),beta12(j,i),beta13(j,i),...
            beta21(j,i),beta22(j,i),beta23(j,i),beta31(j,i),beta32(j,i),beta33(j,i),...
            S1(i),S2(i),S3(i),N1(i),N2(i),N3(i));
        ERN_Flu2(j,i)=ERN2; %effective reproduction number
    end
end

load data18-19;
%% effective reproduction number
for j=1:length(K) 
    [t,y] = ode15s(@Model_Flu_ode,time,y0,[],beta11(j,:)',beta12(j,:)',...
        beta13(j,:)',beta21(j,:)',beta22(j,:)',beta23(j,:)',beta31(j,:)',beta32(j,:)',beta33(j,:)',Data1(:,5:7));
    S1=y(:,1);S2=y(:,2);S3=y(:,3);
    E1=y(:,4);E2=y(:,5);E3=y(:,6);
    I1=y(:,7);I2=y(:,8);I3=y(:,9);
    R1=y(:,10);R2=y(:,11);R3=y(:,12);
    N1=(S1+E1+I1+R1);N2=(S2+E2+I2+R2);N3=(S3+E3+I3+R3);
    for i=1:length(time)
        ERN3=effective_reproduction_number(beta11(j,i),beta12(j,i),beta13(j,i),...
            beta21(j,i),beta22(j,i),beta23(j,i),beta31(j,i),beta32(j,i),beta33(j,i),...
            S1(i),S2(i),S3(i),N1(i),N2(i),N3(i));
        ERN_Flu3(j,i)=ERN3; %effective reproduction number
    end
end

load data22-23;
%% effective reproduction number
for j=1:length(K) 
    [t,y] = ode15s(@Model_Flu_ode,time,y0,[],beta11(j,:)',beta12(j,:)',...
        beta13(j,:)',beta21(j,:)',beta22(j,:)',beta23(j,:)',beta31(j,:)',beta32(j,:)',beta33(j,:)',Data1(:,5:7));
    S1=y(:,1);S2=y(:,2);S3=y(:,3);
    E1=y(:,4);E2=y(:,5);E3=y(:,6);
    I1=y(:,7);I2=y(:,8);I3=y(:,9);
    R1=y(:,10);R2=y(:,11);R3=y(:,12);
    N1=(S1+E1+I1+R1);N2=(S2+E2+I2+R2);N3=(S3+E3+I3+R3);
    for i=1:length(time)
        ERN5=effective_reproduction_number(beta11(j,i),beta12(j,i),beta13(j,i),...
            beta21(j,i),beta22(j,i),beta23(j,i),beta31(j,i),beta32(j,i),beta33(j,i),...
            S1(i),S2(i),S3(i),N1(i),N2(i),N3(i));
        ERN_Flu5(j,i)=ERN5; %effective reproduction number
    end
end

load data23-24;
%% effective reproduction number
for j=1:length(K) 
    [t,y] = ode15s(@Model_Flu_ode,time,y0,[],beta11(j,:)',beta12(j,:)',...
        beta13(j,:)',beta21(j,:)',beta22(j,:)',beta23(j,:)',beta31(j,:)',beta32(j,:)',beta33(j,:)',Data1(:,5:7));
    S1=y(:,1);S2=y(:,2);S3=y(:,3);
    E1=y(:,4);E2=y(:,5);E3=y(:,6);
    I1=y(:,7);I2=y(:,8);I3=y(:,9);
    R1=y(:,10);R2=y(:,11);R3=y(:,12);
    N1=(S1+E1+I1+R1);N2=(S2+E2+I2+R2);N3=(S3+E3+I3+R3);
    for i=1:length(time)
        ERN6=effective_reproduction_number(beta11(j,i),beta12(j,i),beta13(j,i),...
            beta21(j,i),beta22(j,i),beta23(j,i),beta31(j,i),beta32(j,i),beta33(j,i),...
            S1(i),S2(i),S3(i),N1(i),N2(i),N3(i));
        ERN_Flu6(j,i)=ERN6; %effective reproduction number
    end
end

%% Mean and confidence interval
[ERN_fy1,ERN_fx1,ERN_Mean1]= modelCI(time,ERN_Flu1');
[ERN_fy2,ERN_fx2,ERN_Mean2]= modelCI(time,ERN_Flu2');
[ERN_fy3,ERN_fx3,ERN_Mean3]= modelCI(time,ERN_Flu3');
[ERN_fy5,ERN_fx5,ERN_Mean5]= modelCI(time,ERN_Flu5');
[ERN_fy6,ERN_fx6,ERN_Mean6]= modelCI(time,ERN_Flu6');

save('Re_AS.mat','ERN_fy1','ERN_fx1','ERN_Mean1',...
    'ERN_fy2','ERN_fx2','ERN_Mean2','ERN_fy3','ERN_fx3','ERN_Mean3',...
    'ERN_fy5','ERN_fx5','ERN_Mean5','ERN_fy6','ERN_fx6','ERN_Mean6');


figure(5)
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
h1=plot(time,ERN_Mean1,'r-','LineWidth',1.2);
hold on
h2=plot(time,ERN_Mean2,'b-','LineWidth',1.2);
hold on
h3=plot(time,ERN_Mean3,'color',[0.68 0.48 0.0275],'LineWidth',1.2);
hold on
% h4=plot(time,ERN_Mean4,'color',[0.624 0.0667 0.97],'LineWidth',1.2);
% hold on
h5=plot(time,ERN_Mean5,'color',[0 0.5 0],'LineWidth',1.2);
hold on
h6=plot(time,ERN_Mean6,'k-','LineWidth',1.2);
xlabel('Time (weeks)','Interpreter','latex','FontSize',12)
ylabel('Effective reproduction number','Interpreter','latex','FontSize',12)
set(gca,'FontSize',12)
set(gca,'xtick',[1     3     5     7     9    11    13    15    17    19    21    23    25    27    29]);
set(gca,'xticklabel',Labels);
xlim([0.9 length(time)+0.1])
h=legend([h1 h2 h3 h5 h6],'2016-2017','2017-2018','2018-2019','2022-2023','2023-2024', 'Color', 'none');
set(h,'box','off');