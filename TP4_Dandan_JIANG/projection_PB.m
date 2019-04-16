function P_B=projection_PB(u)
norm_u=norm(u,'inf');
if norm_u<=1
    P_B=u;
else
    P_B=u./norm_u;
end
end