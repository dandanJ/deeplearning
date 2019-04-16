function [FI,J]=FISTA(f,lambda,h,K,k,tau)
x=f;
y=x;
t=1;
J=zeros(K,1);
for i=1:K
    XI=x;
    g=y-2*lambda*h*(y-f);
    x=prox_F5(g,h,k,tau);
    t=(1+sqrt(1+4*t^2))/2;
    y=x+((t-1)/(t+1))*(x-XI);
    Dx=[gradx(x),grady(x)];
    J(i)=lambda*norm(f-x,2).^2+norm(Dx,1);
end
FI=x;
end
