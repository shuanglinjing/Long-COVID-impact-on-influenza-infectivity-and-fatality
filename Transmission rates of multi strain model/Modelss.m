function SS = Modelss(theta,data)
% sum-of-squares function
time   = data(:,1);
ydata1  = data(:,2:3);
%% Time point of cubic spline interpolation
t1=[1,15,length(time)];
%% Parameter values at cubic spline interpolation points
pos1=theta(1:length(t1))';
pos2=theta(length(t1)+1:2*length(t1))';
%% Step size of cubic spline interpolation
dt=1;
%% Cubic spline function 
beta1 = abs(Interpolation_fun(t1,pos1,dt));
beta2 = abs(Interpolation_fun(t1,pos2,dt));

%% Solve the model
sigma1=7/2;sigma2=7/2;
y0=[82600000*0.55+197700000*0.5+59800000*0.3,ydata1(1,1)/sigma1,ydata1(1,2)/sigma2,...
    ydata1(1,1),ydata1(1,2),82600000*0.45+197700000*0.5+59800000*0.7];
ymodel = Modelfun(time,y0,beta1,beta2);

%% new cases
new1=sigma1*ymodel(:,2);
new2=sigma2*ymodel(:,3);

%% sum-of-squares function
ss1=sum((new1-ydata1(:,1)).^2);
ss2=sum((new2-ydata1(:,2)).^2);

SS=[ss1 ss2];
