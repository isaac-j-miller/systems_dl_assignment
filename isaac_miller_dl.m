%{
ORIGINAL VALUES:
vehicleMass = 646;
payloadMass = 1354;
mass = vehicleMass+payloadMass;
legAngle = 0.5; %rad
k=5730;
c=811.5;

initialVelocity = 10;
initialDisplacement = 0;
gravity =0;
%}
vehicleMass = 646;
payloadMass = 1354;
mass = vehicleMass+payloadMass;
legAngle = 0.5; %rad
k=5730;
c=6771;
gravity =0;

initialVelocity = 10;
initialDisplacement = 0;

conversion = cos(legAngle).^2;
kAngle = k*conversion;
cAngle = c*conversion;

syms x(t);
ode = 0==mass*(diff(x,2)+gravity)+4*(kAngle*x+cAngle*diff(x));
deriv = diff(x);
cond = [ deriv(0) == initialVelocity; x(0)==initialDisplacement];
xSol(t) = dsolve(ode, cond);
disp(vpa(xSol,4));

tVals = linspace(0,10,1000);
%plot and configure
figure;
plot(tVals,xSol(tVals));
title('Original Lunar Lander System Response when Landing');
xlabel('time (s)');
ylabel('x displacement from equilibrium');