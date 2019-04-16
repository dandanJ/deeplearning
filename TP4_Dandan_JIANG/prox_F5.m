function y=prox_F5(u,h,K,tau)
c=u/h;
z=[gradx(u),grady(u)];
z=projection_PB(z);
[~,N]=size(z);
for i=1:K
    px=z(:,1:N/2);
    py=z(:,N/2+1:N);
    D=div(px,py);%little problem in how to calculate grad(div(z))?
    %z=z+2*tau*[gradx(D)+gradx(c),grady(D)+grady(c)];%gradient descend algorithm
    z=z+2*tau.*[gradx(D)+c,grady(D)+c];
    z=projection_PB(z);
end  
y=u-h*div(z(:,1:N/2),z(:,N/2+1:N));
end% use gradient algorithm to get z
%norm_inf(Z) smaller than 1
