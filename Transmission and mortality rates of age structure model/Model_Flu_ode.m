function out=Model_Flu_ode(t,y,beta11,beta12,beta13,beta21,beta22,beta23,beta31,beta32,beta33,ydata2)
% Flu model

%% Probability of deaths among infected individuals
mu1=ydata2(ceil(t),1);mu2=ydata2(ceil(t),2);mu3=ydata2(ceil(t),3);

%% The natural mortality rate
d1=1/(76*52);d2=1/(58*52);d3=1/(12*52);

%% The rate at which individuals of age-group $k$ transfer into age-group $k+1$ 
alpha1=1/(18*52);alpha2=1/(46*52);alpha3=0;

%% Latent rate
sigma1=7/2;sigma2=7/2;sigma3=7/2;

%% Recovery rate
gamma1=1;gamma2=1;gamma3=1;

%% The rate at which a recovered individual loses immunity
delta1=1/52;delta2=1/52;delta3=1/52;

%% Model variables
S1=y(1);S2=y(2);S3=y(3);
E1=y(4);E2=y(5);E3=y(6);
I1=y(7);I2=y(8);I3=y(9);
R1=y(10);R2=y(11);R3=y(12);

%% Total population of three age groups
N1=(S1+E1+I1+R1);N2=(S2+E2+I2+R2);N3=(S3+E3+I3+R3);

%% The recruitment rate of susceptible individuals
Lambda=3600000/52;

%% The force of infection among individuals in age-group $k$
lambda1=(beta11(ceil(t))*I1/N1+beta12(ceil(t))*I2/N2+beta13(ceil(t))*I3/N3);
lambda2=(beta21(ceil(t))*I1/N1+beta22(ceil(t))*I2/N2+beta23(ceil(t))*I3/N3);
lambda3=(beta31(ceil(t))*I1/N1+beta32(ceil(t))*I2/N2+beta33(ceil(t))*I3/N3);

%% 0-18,19-64,65+
%% S
dS1=Lambda-S1*lambda1+delta1*R1-d1*S1-alpha1*S1;
dS2=alpha1*S1-S2*lambda2+delta2*R2-d2*S2-alpha2*S2;
dS3=alpha2*S2-S3*lambda3+delta3*R3-d3*S3-alpha3*S3;

%% E
dE1=S1*lambda1-sigma1*E1-d1*E1-alpha1*E1;
dE2=alpha1*E1+S2*lambda2-sigma2*E2-d2*E2-alpha2*E2;
dE3=alpha2*E2+S3*lambda3-sigma3*E3-d3*E3-alpha3*E3;

%% I
dI1=sigma1*E1-gamma1*I1-d1*I1-alpha1*I1;
dI2=alpha1*I1+sigma2*E2-gamma2*I2-d2*I2-alpha2*I2;
dI3=alpha2*I2+sigma3*E3-gamma3*I3-d3*I3-alpha3*I3;

%% R
dR1=(1-mu1)*gamma1*I1-delta1*R1-d1*R1-alpha1*R1;
dR2=alpha1*R1+(1-mu2)*gamma2*I2-delta2*R2-d2*R2-alpha2*R2;
dR3=alpha2*R2+(1-mu3)*gamma3*I3-delta3*R3-d3*R3-alpha3*R3;


out=[dS1;dS2;dS3;dE1;dE2;dE3;dI1;dI2;dI3;dR1;dR2;dR3];
