function y=prox_F4(u,h)
y=(u-h).*(u>h)+(u+h).*(u<(-h))+0.*(abs(u)<=h);
end

