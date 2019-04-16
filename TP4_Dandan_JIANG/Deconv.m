function [D,J]=Deconv(lambda,h,f,K,k,tau)
x=f;
[M,~]=size(f);
G = fspecial('gaussian',size(f));
J=zeros(K,1);
for i=1:K
    dF=gradF(x,f,lambda,G);
    g=x-h*dF;
    x=prox_F5(g,h,k,tau);
    D=x;
    Dx=[gradx(x),grady(x)];
    J(i)=lambda*norm(f-imfilter(f,G,'replicate'),2).^2+norm(Dx,1);
end
end
function F= gradF(u,f,lambda,G)
    [M,~] = size(G);
    U=u+lambda*(imfilter(f,G,'replicate'));
    Id = eye(M);
    V = (Id+lambda*imfilter(G,G,'replicate'));
    %V = inv(V);
    F=lambda*2*(U\V);
end
