function [u,J] = Inpaint_1(f,K,lambda,h,k,tau,Mask)
u=f;
J=zeros(K,1);
for i=1:K
    dF=gradF(u,f,lambda,Mask);
    u = u - h* dF;
    u = prox_F5(u,h,k,tau);
    Du=[gradx(u),grady(u)];
    J(i)=lambda*norm(f-Mask.*u,2).^2+norm(Du,1);
end
end

function F= gradF(x,f,lambda,Mask)
    [M,~] = size(Mask);
    Id = eye(M);
    V=(Id+lambda*Mask*Mask');
    V=inv(V);
    U=(x+lambda*Mask.*f);
    F=lambda*2*(V*U);
end