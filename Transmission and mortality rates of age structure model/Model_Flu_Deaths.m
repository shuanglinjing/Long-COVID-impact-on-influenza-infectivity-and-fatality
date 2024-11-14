function out=Model_Flu_Deaths(t,y,ydata1)
% Deaths model

%% The natural mortality rate
d1=1/(76*52);d2=1/(58*52);d3=1/(12*52);

%% The rate at which individuals of age-group $k$ transfer into age-group $k+1$ 
alpha1=1/(18*52);alpha2=1/(46*52);alpha3=0;

%% Recovery rate
gamma1=1;gamma2=1;gamma3=1;

%% Model variables
I1=y(1);I2=y(2);I3=y(3);

%% 0-18,19-64,65+
%% I
dI1=ydata1(ceil(t),1)-gamma1*I1-d1*I1-alpha1*I1;
dI2=alpha1*I1+ydata1(ceil(t),2)-gamma2*I2-d2*I2-alpha2*I2;
dI3=alpha2*I2+ydata1(ceil(t),3)-gamma3*I3-d3*I3-alpha3*I3;

out=[dI1;dI2;dI3];
