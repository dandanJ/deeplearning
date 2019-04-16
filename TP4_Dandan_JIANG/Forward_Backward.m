function [FB,J]=Forward_Backward(lambda,h,f,K,k,tau)
x=f;
J=zeros(K,1);
for i=1:K
    g=x-2*lambda*h*(f-x);
    x=prox_F5(g,h,k,tau);
    FB=x;
    Dx=[gradx(x),grady(x)];
    J(i)=lambda*norm(f-x,2).^2+norm(Dx,1);
end
end