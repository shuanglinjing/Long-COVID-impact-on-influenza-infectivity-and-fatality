function [new1,new2]=Model_cases(time,y0,beta1,beta2)

[t,y] = ode15s(@Model_Flu_ode,time,y0,[],beta1,beta2);

sigma1=7/2;sigma2=7/2;
gamma1=1;gamma2=1;
%% new cases
new1=sigma1*y(:,2);
new2=sigma2*y(:,3);

