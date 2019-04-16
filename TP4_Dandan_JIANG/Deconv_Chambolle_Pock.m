function DCP=Deconv_Chambolle_Pock(f,lambda,sigma,K,tau)
x_hat=f;
x=f;
y=zeros([size(f),2]);
[M,~]=size(f);
G = fspecial('gaussian',M);
for i=1:K
    XI=x;
    %prox_sigmaF^*(u)
    g=y-2*lambda*sigma*cat(3,gradx(x_hat),grady(x_hat));
    norm_g=max(1,sqrt(g(:,:,1).^2+g(:,:,2).^2));
    g(:,:,1)=g(:,:,1)./norm_g;
    g(:,:,2)=g(:,:,2)./norm_g;
    
    %proxG
    divengence=div(g(:,:,1),g(:,:,2));
    g_1=x+tau.*divengence;
    %x=prox_F4(g_1,tau);
    x=(g_1-tau).*(g_1>tau)+(g_1+tau).*(g_1<(-tau))+0.*(abs(g_1)<=tau);
    x_hat=2*x-XI;
    DCP=x;
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