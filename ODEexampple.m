%solving the system of ODEs using ode45
%time interval is [0,20]
%Initial condition is (2,0)
mu = 1;
[t,y] = ode45(@(t,y) vdp1(t,y,mu),[0,20],[2;0]);

%%
%plotting y1 vs y2
figure;
plot(y(:,1),y(:,2),'-o')

%%
%plotting solutions of y1 and y2 against t
figure;
plot(t,y(:,1), '-o', t, y(:,2),'-o')
%%
a = [];
t = 0; %system is autonomous

%Computing eigenvalues of the Jacobian at the eq'm point for mu between -2 and 2
for u = (-2:0.5:2)

    [x,fval,exitflag,output,J] = fsolve(@(y) vdp1(t,y,u),[2;0]);

    a(end+1) = max(real(eig(J))); %max of the real part of eigenvalues of Jacobian
end

%plotting max of the real part of eigenvalues of Jacobian vs mu
figure;
plot((-2:0.5:2),a)


%Define van der Pol oscillator system of ODEs as a function
function dydt = vdp1(t,y,mu)
    dy1 = y(2); %y1' = y2
    dy2 = mu*(1-y(1)^2)*y(2) - y(1); %y2' = mu(1-y1^2)y2 - y1

    dydt = [dy1; dy2]; %function output
end

