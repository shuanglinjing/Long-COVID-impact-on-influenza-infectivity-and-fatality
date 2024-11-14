function Y=Modelfun(time,y0,beta1,beta2)

[t,y] = ode15s(@Model_Flu_ode,time,y0,[],beta1,beta2);
Y=y;