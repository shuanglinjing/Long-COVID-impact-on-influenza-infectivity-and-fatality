function ERN=effective_reproduction_number(beta1,beta2,S,N)

d=1/(76*52);sigma1=7/2;sigma2=7/2;gamma1=1;gamma2=1;

F=[0 0 beta1*S/N 0;
   0 0 0 beta2*S/N;
   0 0 0 0
   0 0 0 0];

V=[sigma1+d 0 0 0;
   0 sigma2+d 0 0 ;
   -sigma1 0 gamma1+d 0;
   0 -sigma2 0 gamma2+d];

VV=inv(V);

ERN=max(abs(eig(F*VV)));