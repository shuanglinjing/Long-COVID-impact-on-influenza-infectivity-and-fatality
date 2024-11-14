clc
clear
%% new deaths
D1=xlsread('Death data(18).xlsx');
D2=xlsread('Death data(18-64).xlsx');
D3=xlsread('Death data(65).xlsx');
D_flu=[D1(:,7),D2(:,7),D3(:,7)];
nan_indices = isnan(D_flu);
D_flu(nan_indices) = 0;

%% new cases
New1=xlsread('Data_age.csv');
New_flu=[New1(:,3)+New1(:,4),New1(:,5)+New1(:,6),New1(:,7)]*330000000/30000000;

weeks=[1:1:30]';%weeks
data=[weeks,[New_flu(366:395,:),D_flu(366:395,:)]];

time   = data(:,1);
ydata1  = data(:,2:4);
ydata2  = data(:,5:7);

%% Solve the model
y0 =ydata1(1,:); %initial  value
[t,ymodel] = ode15s(@Model_Flu_Deaths,time,y0,[],ydata1);

%% Recovery rate
gamma1=1;gamma2=1;gamma3=1;
%% Probability of deaths among infected individuals
mu1=ydata2(:,1)./(gamma1*ymodel(:,1));
mu2=ydata2(:,2)./(gamma2*ymodel(:,2));
mu3=ydata2(:,3)./(gamma3*ymodel(:,3));


Data1=[weeks,[New_flu(366:395,:),mu1,mu2,mu3]];

method   = 'dram';  % adaptation method, 'mh', 'dr', 'am', or 'dram'
nsimu    = 500000;   % number of simulations
adaptint = 500;   % how often to adapt the proposal
Nsimu    = 450001;  % burn-in

%model.sigma2=0.01;
model.S20 = [1,1,1];
model.N0  = [4,4,4];
options.method      = method;        % adaptation method (mh,am,dr,dram)
options.nsimu       = nsimu;         % n:o of simulations
%options.qcov        = eye(18)*1e-15; % proposal covariance 
options.adaptint    = adaptint; % adaptation interval 
options.printint    = 200; % how often to show info on acceptance ratios 
options.verbosity   = 1;  % how much to show output in Matlab window 
options.waitbar     = 1;  % show garphical waitbar
options.updatesigma = 1;  % update error variance 
options.stats       = 1;  % save extra statistics in results 

%% The model sum of squares
model.ssfun = @Modelss;

%% Initial value of parameters
k0=[0.1,0.2,0.1,0.1,0.2,0.1,0.1,0.2,0.1];
k1=[0.1,0.2,0.1,0.1,0.2,0.1,0.1,0.2,0.1];
k2=[0.2,0.4,0.2,0.2,0.4,0.2,0.2,0.4,0.2];
%% Interval of parameters
params = {
    {'a11',k0(1),  0,100}  
    {'a12',k0(2),  0,100} 
    {'a13',k0(3),  0,100}  
    {'a21',k0(4),  0,100}  
    {'a22',k0(5),  0,100} 
    {'a23',k0(6),  0,100}  
    {'a31',k0(7),  0,100}  
    {'a32',k0(8),  0,100} 
    {'a33',k0(9),  0,100}  
    {'b11',k1(1),  0,100}  
    {'b12',k1(2),  0,100} 
    {'b13',k1(3),  0,100} 
    {'b21',k1(4),  0,100}  
    {'b22',k1(5),  0,100} 
    {'b23',k1(6),  0,100} 
    {'b31',k1(7),  0,100}  
    {'b32',k1(8),  0,100} 
    {'b33',k1(9),  0,100} 
    {'c11',k2(1),  0,100}  
    {'c12',k2(2),  0,100} 
    {'c13',k2(3),  0,100} 
    {'c21',k2(4),  0,100}  
    {'c22',k2(5),  0,100} 
    {'c23',k2(6),  0,100} 
    {'c31',k2(7),  0,100}  
    {'c32',k2(8),  0,100} 
    {'c33',k2(9),  0,100} 
    };

 
%% First generate an initial chain.
results = [];
[results, chain, s2chain,sschain]=mcmcrun(model,Data1,params,options,results);

%% Chain plots should reveal that the chain has converged and we can use the results for estimation and predictive inference.
figure(1); clf
mcmcplot(chain(Nsimu:nsimu,:),[],results,'chainpanel');
figure(2); clf
mcmcplot(chain(Nsimu:nsimu,:),[],results,'hist',20)
% mcmcplot(chain,[],results,'pairs');
figure(3); clf
mcmcplot(chain(Nsimu:nsimu,:),[],results,'denspanel',2);

%% Mean and std of parameters
OUT=chainstats(chain(Nsimu:nsimu,:),results); 

chain_P=chain(Nsimu:nsimu,:);

%% Randomly select 5000 sets of parameters according to uniform distribution
chain_s2 = randi([1,length(chain_P)],1,5000);
for j=1:length(chain_s2)
    Par(j,:)=chain_P(chain_s2(j),:);
end
K=Par;

for j=1:length(K)
    %% Time point of cubic spline interpolation
    t1=[1,15,length(time)];
    %% Parameter values at cubic spline interpolation points
    pos11=K(j,1:length(t1))';
    pos12=K(j,length(t1)+1:2*length(t1))';
    pos13=K(j,2*length(t1)+1:3*length(t1))';
    pos21=K(j,3*length(t1)+1:4*length(t1))';
    pos22=K(j,4*length(t1)+1:5*length(t1))';
    pos23=K(j,5*length(t1)+1:6*length(t1))';
    pos31=K(j,6*length(t1)+1:7*length(t1))';
    pos32=K(j,7*length(t1)+1:8*length(t1))';
    pos33=K(j,8*length(t1)+1:end)';
    %% Step size of cubic spline interpolation
    dt=1;
    %% Cubic spline function 
    beta11(j,:) = abs(Interpolation_fun(t1,pos11,dt));
    beta12(j,:) = abs(Interpolation_fun(t1,pos12,dt));
    beta13(j,:) = abs(Interpolation_fun(t1,pos13,dt));
    beta21(j,:) = abs(Interpolation_fun(t1,pos21,dt));
    beta22(j,:) = abs(Interpolation_fun(t1,pos22,dt));
    beta23(j,:) = abs(Interpolation_fun(t1,pos23,dt));
    beta31(j,:) = abs(Interpolation_fun(t1,pos31,dt));
    beta32(j,:) = abs(Interpolation_fun(t1,pos32,dt));
    beta33(j,:) = abs(Interpolation_fun(t1,pos33,dt));
    %% Number of new cases
    sigma1=7/2;sigma2=7/2;sigma3=7/2;
    y0=[82600000*0.55,197700000*0.5,59800000*0.3,ydata1(1,1)/sigma1,ydata1(1,2)/sigma2,ydata1(1,3)/sigma3,...
    ydata1(1,1),ydata1(1,2),ydata1(1,3),82600000*0.45,197700000*0.5,59800000*0.7];
    [new1,new2,new3,Death1,Death2,Death3]=Model_cases(time,y0,beta11(j,:)',beta12(j,:)',...
        beta13(j,:)',beta21(j,:)',beta22(j,:)',beta23(j,:)',beta31(j,:)',beta32(j,:)',beta33(j,:)',Data1(:,5:7));
    New1_Flu(j,:)=new1; %new cases
    New2_Flu(j,:)=new2; %new cases
    New3_Flu(j,:)=new3; %new cases
    Death1_Flu(j,:)=Death1;%new deaths
    Death2_Flu(j,:)=Death2;%new deaths
    Death3_Flu(j,:)=Death3;%new deaths
end

%% Mean and confidence interval
[fy1,fx1,Mean1]= modelCI(time,New1_Flu');
[fy2,fx2,Mean2]= modelCI(time,New2_Flu');
[fy3,fx3,Mean3]= modelCI(time,New3_Flu');
[fy4,fx4,Mean4]= modelCI(time,Death1_Flu');
[fy5,fx5,Mean5]= modelCI(time,Death2_Flu');
[fy6,fx6,Mean6]= modelCI(time,Death3_Flu');
beta1=(beta11+beta12+beta13)/3;
beta2=(beta21+beta22+beta23)/3;
beta3=(beta31+beta32+beta33)/3;
[fy_beta1,fx_beta1,Mean_beta1]= modelCI(time,beta1');
[fy_beta2,fx_beta2,Mean_beta2]= modelCI(time,beta2');
[fy_beta3,fx_beta3,Mean_beta3]= modelCI(time,beta3');

save data23-24;

%% Simulation results
fig = figure(4);
[ha, pos] = tight_subplot(2,3,[.09 .12],[.08 .035],[.06 .07]);
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
ylabel('New cases')
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',{'2016-40','2016-43','2016-46','2016-49','2016-52','2017-3',...
    '2017-6','2017-9','2017-12','2017-15'});
xtb = get(gca,'XTickLabel');
xt = get(gca,'XTick');
yt = get(gca,'YTick');     
xtextp=xt;        
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');
xlim([0.5 length(time)+0.5])
yyaxis right;
plot(time,(mean(beta11)+mean(beta12)+mean(beta13))/3,'b','LineWidth',1.5)
ylabel('Transmission rate (\beta(t))')
xlim([0.5 length(time)+0.5])
title('(A)')

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
ylabel('New cases')
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',{'2016-40','2016-43','2016-46','2016-49','2016-52','2017-3',...
    '2017-6','2017-9','2017-12','2017-15'});
xtb = get(gca,'XTickLabel');
xt = get(gca,'XTick');
yt = get(gca,'YTick');      
xtextp=xt;                 
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');
xlim([0.5 length(time)+0.5])
yyaxis right;
plot(time,(mean(beta21)+mean(beta22)+mean(beta23))/3,'b','LineWidth',1.5)
ylabel('Transmission rate (\beta(t))')
xlim([0.5 length(time)+0.5])
title('(B)')

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
ylabel('New cases')
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',{'2016-40','2016-43','2016-46','2016-49','2016-52','2017-3',...
    '2017-6','2017-9','2017-12','2017-15'});
xtb = get(gca,'XTickLabel');
xt = get(gca,'XTick');
yt = get(gca,'YTick');  
xtextp=xt;                   
ytextp=-0.02*yt(3)*ones(1,length(xt));
text(xtextp,ytextp,xtb,'HorizontalAlignment','right','rotation',60,'fontsize',10);
set(gca,'xticklabel','');
xlim([0.5 length(time)+0.5])
yyaxis right;
plot(time,(mean(beta31)+mean(beta32)+mean(beta33))/3,'b','LineWidth',1.5)
ylabel('Transmission rate (\beta(t))')
xlim([0.5 length(time)+0.5])
legend('95% CI','New cases','Estimated cases','Transmission rate')
title('(C)')



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
ylabel('New deaths')
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',{'2016-40','2016-43','2016-46','2016-49','2016-52','2017-3',...
    '2017-6','2017-9','2017-12','2017-15'});
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
ylabel('Death rate (\gamma_{1}\mu_{1}(t))')
xlim([0.5 length(time)+0.5])
title('(D)')


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
ylabel('New deaths')
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',{'2016-40','2016-43','2016-46','2016-49','2016-52','2017-3',...
    '2017-6','2017-9','2017-12','2017-15'});
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
ylabel('Death rate (\gamma_{1}\mu_{2}(t))')
xlim([0.5 length(time)+0.5])
title('(E)')


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
ylabel('New deaths')
set(gca,'FontSize',12)
set(gca,'xtick',[1     4     7    10    13    16    19    22    25    28]);
set(gca,'xticklabel',{'2016-40','2016-43','2016-46','2016-49','2016-52','2017-3',...
    '2017-6','2017-9','2017-12','2017-15'});
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
ylabel('Death rate (\gamma_{3}\mu_{3}(t))')
xlim([0.5 length(time)+0.5])
legend('New deaths','Estimated cases','Death rate')
title('(F)')


