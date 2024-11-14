function out=Model_Flu_ode(t,y,beta1,beta2)
%% Flu model

%% The natural mortality rate
d=1/(76*52);

%% Latent rate
sigma1=7/2;sigma2=7/2;

%% Recovery rate
gamma1=1;gamma2=1;

%% The rate at which a recovered individual loses immunity
delta=1/52;

%% Model variables
S=y(1);E1=y(2);E2=y(3);I1=y(4);I2=y(5);R=y(6);

%% Total population
N=(S+E1+E2+I1+I2+R);

%% The recruitment rate of susceptible individuals
Lambda=3600000/52;

%% S
dS=Lambda-S*(beta1(ceil(t))*I1/N+beta2(ceil(t))*I2/N)+delta*R-d*S;

%% E
dE1=S*beta1(ceil(t))*I1/N-sigma1*E1-d*E1;
dE2=S*beta2(ceil(t))*I2/N-sigma2*E2-d*E2;

%% I
dI1=sigma1*E1-gamma1*I1-d*I1;
dI2=sigma2*E2-gamma2*I2-d*I2;

%% R
dR=gamma1*I1+gamma2*I2-delta*R-d*R;

out=[dS;dE1;dE2;dI1;dI2;dR];
