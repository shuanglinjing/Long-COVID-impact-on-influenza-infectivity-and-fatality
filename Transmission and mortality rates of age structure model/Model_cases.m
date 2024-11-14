function [new1,new2,new3,Death1,Death2,Death3]=Model_cases(time,y0,beta11,beta12,beta13,beta21,beta22,beta23,beta31,beta32,beta33,ydata2)

[t,y] = ode15s(@Model_Flu_ode,time,y0,[],beta11,beta12,beta13,beta21,beta22,beta23,beta31,beta32,beta33,ydata2);

%% Latent rate
sigma1=7/2;sigma2=7/2;sigma3=7/2;
%% Recovery rate
gamma1=1;gamma2=1;gamma3=1;

%% new cases
new1=sigma1*y(:,4);
new2=sigma2*y(:,5);
new3=sigma3*y(:,6);

%% new deaths
Death1=gamma1*ydata2(:,1).*y(:,7);
Death2=gamma2*ydata2(:,2).*y(:,8);
Death3=gamma3*ydata2(:,3).*y(:,9);

