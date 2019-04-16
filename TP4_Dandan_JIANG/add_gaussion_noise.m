function out=add_gaussion_noise(I,s)
[m,n]=size(I);
out=I+s*randn(m,n);
