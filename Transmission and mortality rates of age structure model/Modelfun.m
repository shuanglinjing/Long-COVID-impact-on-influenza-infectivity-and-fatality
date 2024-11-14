function Y=Modelfun(time,y0,beta11,beta12,beta13,beta21,beta22,beta23,beta31,beta32,beta33,ydata2)

[t,y] = ode15s(@Model_Flu_ode,time,y0,[],beta11,beta12,beta13,beta21,beta22,beta23,beta31,beta32,beta33,ydata2);
Y=y;