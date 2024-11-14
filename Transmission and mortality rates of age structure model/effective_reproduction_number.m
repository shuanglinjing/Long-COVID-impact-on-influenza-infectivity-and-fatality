function ERN=effective_reproduction_number(beta11,beta12,beta13,...
        beta21,beta22,beta23,beta31,beta32,beta33,S1,S2,S3,N1,N2,N3)

%% The natural mortality rate
d1=1/(76*52);d2=1/(58*52);d3=1/(12*52);

%% The rate at which individuals of age-group $k$ transfer into age-group $k+1$ 
alpha1=1/(18*52);alpha2=1/(46*52);alpha3=0;

%% Latent rate
sigma1=7/2;sigma2=7/2;sigma3=7/2;

%% Recovery rate
gamma1=1;gamma2=1;gamma3=1;


F=[0 0 0 beta11*S1/N1 beta12*S1/N2 beta13*S1/N3;
   0 0 0 beta21*S2/N1 beta22*S2/N2 beta23*S2/N3;
   0 0 0 beta31*S3/N1 beta32*S3/N2 beta33*S3/N3;
   0 0 0 0 0 0;
   0 0 0 0 0 0;
   0 0 0 0 0 0];

V=[sigma1+d1+alpha1 0 0 0 0 0;
   -alpha1 sigma2+d2+alpha2 0 0 0 0;
   0 -alpha2 sigma3+d3+alpha3 0 0 0;
   -sigma1 0 0 gamma1+d1+alpha1 0 0;
   0 -sigma2 0 -alpha1 gamma2+d2+alpha2 0;
   0 0 -sigma3 0 -alpha2 gamma3+d3+alpha3];

VV=inv(V);

ERN=max(abs(eig(F*VV)));