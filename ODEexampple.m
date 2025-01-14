
mu = 1;
[t,y] = ode45(@(t,y) vdp1(t,y,mu),[0,20],[2;0]);

%%
figure;
plot(y(:,1),y(:,2),'-o')

%%
figure;
plot(t,y(:,1), '-o', t, y(:,2),'-o')
%%
a = [];
t = 0;
for u = (-2:0.5:2)

    [x,fval,exitflag,output,J] = fsolve(@(y) vdp1(t,y,u),[2;0]);

    a(end+1) = max(real(eig(J)));
end

figure;
plot((-2:0.5:2),a)



function dydt = vdp1(t,y,mu)
    dy1 = y(2);
    dy2 = mu*(1-y(1)^2)*y(2) - y(1);

    dydt = [dy1; dy2];
end

