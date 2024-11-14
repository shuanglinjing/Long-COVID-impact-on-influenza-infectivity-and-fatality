function SS = Modelss(theta,data)
% sum-of-squares function
time   = data(:,1);
ydata1  = data(:,2:4);
ydata2  = data(:,5:7);
%% Time point of cubic spline interpolation
t1=[1,15,length(time)];
%% Parameter values at cubic spline interpolation points
pos11=theta(1:length(t1))';
pos12=theta(length(t1)+1:2*length(t1))';
pos13=theta(2*length(t1)+1:3*length(t1))';
pos21=theta(3*length(t1)+1:4*length(t1))';
pos22=theta(4*length(t1)+1:5*length(t1))';
pos23=theta(5*length(t1)+1:6*length(t1))';
pos31=theta(6*length(t1)+1:7*length(t1))';
pos32=theta(7*length(t1)+1:8*length(t1))';
pos33=theta(8*length(t1)+1:end)';
%% Step size of cubic spline interpolation
dt=1;
%% Cubic spline function 
beta11 = abs(Interpolation_fun(t1,pos11,dt));
beta12 = abs(Interpolation_fun(t1,pos12,dt));
beta13 = abs(Interpolation_fun(t1,pos13,dt));
beta21 = abs(Interpolation_fun(t1,pos21,dt));
beta22 = abs(Interpolation_fun(t1,pos22,dt));
beta23 = abs(Interpolation_fun(t1,pos23,dt));
beta31 = abs(Interpolation_fun(t1,pos31,dt));
beta32 = abs(Interpolation_fun(t1,pos32,dt));
beta33 = abs(Interpolation_fun(t1,pos33,dt));

%% Solve the model
sigma1=7/2;sigma2=7/2;sigma3=7/2;
y0=[82600000*0.55,197700000*0.5,59800000*0.3,ydata1(1,1)/sigma1,ydata1(1,2)/sigma2,ydata1(1,3)/sigma3,...
    ydata1(1,1),ydata1(1,2),ydata1(1,3),82600000*0.45,197700000*0.5,59800000*0.7];
ymodel = Modelfun(time,y0,beta11,beta12,beta13,beta21,beta22,beta23,beta31,beta32,beta33,ydata2);

%% new cases
new1=sigma1*ymodel(:,4);
new2=sigma2*ymodel(:,5);
new3=sigma3*ymodel(:,6);

%% sum-of-squares function
ss1=sum((new1-ydata1(:,1)).^2);
ss2=sum((new2-ydata1(:,2)).^2);
ss3=sum((new3-ydata1(:,3)).^2);

SS=[ss1 ss2 ss3];
