clc
clear
%% Different strains of influenza
[W1,W2]=xlsread('influenza_US_strain.xlsx');

New_flu=[W1(:,[11,15,19,23,27,31,35,39,43,47,51,55])];
nan_indices = isnan(New_flu);
New_flu(nan_indices) = 0;

time=[1:1:30]';%weeks

%Data1=[time,New_flu(405:434,7),New_flu(405:434,11)];
%Data1=[time,New_flu(457:486,7),New_flu(457:486,11)];
%Data1=[time,New_flu(509:539,7),New_flu(509:539,11)];
%Data1=[time,New_flu(666:695,7),New_flu(666:695,11)];
%Data1=[time,New_flu(718:747,7),New_flu(718:747,11)];
Data1=[time,New_flu(770:799,7),New_flu(770:799,11)];
%Data2=[time,New_flu(405:434,:)];

method   = 'dram';   % adaptation method, 'mh', 'dr', 'am', or 'dram'
nsimu    = 500000;   % number of simulations
adaptint = 500;      % how often to adapt the proposal
Nsimu    = 450001;   % burn-in

%model.sigma2=0.01;
model.S20 = [1 1];
model.N0  = [4 4];
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
k0=[2 2 1];
k1=[2 2 1];
%% Interval of parameters
params = {
    {'a1',k0(1),  0,100}  
    {'a2',k0(2),  0,100} 
    {'a3',k0(3),  0,100}   
    {'b1',k1(1),  0,100}  
    {'b2',k1(2),  0,100} 
    {'b3',k1(3),  0,100}  
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
    pos1=K(j,1:length(t1))';
    pos2=K(j,length(t1)+1:2*length(t1))';
    %% Step size of cubic spline interpolation
    dt=1;
    %% Cubic spline function 
    beta1(j,:) = abs(Interpolation_fun(t1,pos1,dt));
    beta2(j,:) = abs(Interpolation_fun(t1,pos2,dt));
    %% Number of new cases
    sigma1=7/2;sigma2=7/2;
    y0=[82600000*0.55+197700000*0.5+59800000*0.3,Data1(1,2)/sigma1,Data1(1,3)/sigma2,...
    Data1(1,2),Data1(1,3),82600000*0.45+197700000*0.5+59800000*0.7];
    [new1,new2]=Model_cases(time,y0,beta1(j,:)',beta2(j,:)');
    New1_Flu(j,:)=new1; %new cases
    New2_Flu(j,:)=new2; %new cases
end

[fy1,fx1,Mean1]= modelCI(time,New1_Flu');%new cases(Mean and confidence interval)
[fy2,fx2,Mean2]= modelCI(time,New2_Flu');%new cases(Mean and confidence interval)
[fy_beta1,fx_beta1,Mean_beta1]= modelCI(time,beta1');%transmission rate(Mean and confidence interval)
[fy_beta2,fx_beta2,Mean_beta2]= modelCI(time,beta2');%transmission rate(Mean and confidence interval)

save data23-24;

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
H_F1=fill(fx_beta1,fy_beta1,[0.57 0.82 0.99]);
set(H_F1,{'LineStyle'},{'none'});
hold on
plot(time,Mean_beta1,'b','LineWidth',1.5)
ylabel('Transmission rate ($\beta_{1}(t))$','Interpreter','latex','FontSize',12)
xlim([0.8 length(time)+0.2])
ylim([0,3])
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
H_F1=fill(fx_beta2,fy_beta2,[0.57 0.82 0.99]);
set(H_F1,{'LineStyle'},{'none'});
hold on
plot(time,Mean_beta2,'b','LineWidth',1.5)
ylabel('Transmission rate ($\beta_{2}(t))$','Interpreter','latex','FontSize',12)
xlim([0.8 length(time)+0.2])
ylim([0,3])
alpha(0.5);
title('(B) Influenza B','Interpreter','latex','FontSize',12)

