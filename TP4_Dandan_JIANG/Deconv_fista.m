function [FI,J]=Deconv_fista(f,lambda,h,K,k,tau)
x=f;
y=x;
t=1;
[M,~]=size(f);
G = fspecial('gaussian',M);
J=zeros(K,1);
for i=1:K
    XI=x;
    dF=gradF(x,f,lambda,G);
    g=y-h*dF;
    x=prox_F5(g,h,k,tau);
    t=(1+sqrt(1+4*t^2))/2;
    y=x+((t-1)/(t+1))*(x-XI);
    Dx=[gradx(x),grady(x)];
    J(i)=lambda*norm(f-imfilter(f,G,'replicate'),2).^2+norm(Dx,1);
end
FI=x;
end
function F= gradF(u,f,lambda,G)
    [M,~] = size(G);
    U=u+lambda*(imfilter(f,G,'replicate'));
    Id = eye(M);
    V = (Id+lambda*imfilter(G,G,'replicate'));
    %V = inv(V);
    F=lambda*2*(U\V);
end
