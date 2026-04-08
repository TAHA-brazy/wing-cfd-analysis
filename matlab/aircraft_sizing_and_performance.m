%% Aircraft Preliminary Design and Performance Analysis
% Author: Taha Brazy
%
% Description:
% This script performs preliminary aircraft sizing based on Raymer methodology.
% It includes:
% - Weight estimation
% - Constraint analysis (W/S vs W/P)
% - Performance calculations
% - Wing geometry estimation

clc; clear; close all;

%% =======================
% Weight Estimation
% =======================

a_range = -0.06:0.0001:0.04;

GTOW = [1.616 4.963 7.8 9.45 11.93 12.31] * 0.4536; % kg
wewo = [0.4764 0.598 0.5363 0.51322 0.5062 0.5369];

figure;
hold on; grid on;

for i = 1:length(GTOW)
    b_vals = wewo(i) - a_range .* GTOW(i);
    plot(a_range, b_vals, 'LineWidth', 1.5);
end

xlabel('a (Coefficient of GTOW)');
ylabel('b (Empty Weight Coefficient)');
title('Weight Estimation Curves');

% Design space
x = [-0.0479 -0.0417 -0.0292 -0.0185 0.0125 0.0104 0.0062];
y = [0.7058 0.692 0.6642 0.6402 0.4671 0.4686 0.4726];
patch(x, y, 'red', 'FaceAlpha', 0.2);

% Design point
a = -0.02;
b = 0.622;
plot(a, b, 'k*', 'MarkerSize', 8);

legend('Ebee','Zephyr2','Eflite Opterra','RVJet','Skywalker X8','Viper X10','Design Space','Design Point');

% Solve for weights
Wp = 1.5 * 0.4536; % payload [kg]
Wb = 2.2 * 0.4536; % battery [kg]

syms Wto We
[We, Wto] = vpasolve(a*Wto^2 + b*Wto == We, Wto - Wb - We == Wp);

Wto = double(Wto(1));
Wto = Wto * 1.05; % Add 5% margin

%% =======================
% Constraint Analysis (W/S vs W/P)
% =======================

close all;
w_s = 0:0.01:50;

rho = 1.225; % Air density [kg/m^3]
vs = 9.4; % Stall speed [m/s]
clmax = 0.9 * 1.2;

ws_vs = 0.5 * rho * vs^2 * clmax / 9.81;

figure;
hold on; grid on;

plot(ws_vs * ones(size(w_s)), w_s, 'LineWidth', 2); % Stall constraint

% Aerodynamic parameters
cd0 = 0.015;
AR = 5.618;
e = 0.9;
k = 1 / (pi * AR * e);
etap = 0.8;

% Ceiling constraint
segac = (1 - 6.873e-6 * 400)^4.25587;
rocc = 0.5;

L_D = sqrt(cd0 / k) / (2 * cd0);

wp_ac = segac ./ (rocc/etap + sqrt(2 ./ (1.225 * segac * sqrt(3*cd0/k)) .* w_s) .* (1.155/(L_D * etap))) / 9.81;
plot(w_s, wp_ac, 'LineWidth', 2);

% Maximum speed constraint
vc = 16;
vmax = vc / 0.8;
seg = (1 - 6.873e-6 * 200)^4.26;

wp_vm = etap ./ (0.5*rho*vmax^3*cd0./w_s + 2*k./(rho*seg*vmax).*w_s) / 9.81;
plot(w_s, wp_vm, 'LineWidth', 2);

% Takeoff constraint
vto = 1.2 * vs;
g = 9.81;
mue = 0.1;
cdg = 0.0225;
sto = 5;
clr = 0.7;

wp_sto = (etap/vto) * (1 - exp(0.6*rho*g*cdg*sto ./ w_s)) ./ ...
         (mue - (mue + cdg/clr).*exp(0.6*rho*g*cdg*sto ./ w_s)) / 9.81;

plot(w_s, wp_sto, 'LineWidth', 2);

% Rate of climb
roc = 0.6;

wp_roc = 1 ./ (roc/etap + sqrt(2./(rho*sqrt(3*cd0/k)).*w_s) .* ...
        (1.155/(sqrt(cd0/k)/(2*cd0)*etap))) / 9.81;

plot(w_s, wp_roc, 'LineWidth', 2);

xlabel('Wing Loading W/S [kg/m^2]');
ylabel('Power Loading W/P [kg/W]');
title('Constraint Analysis');

patch([0 5.958 5.958], [0 0.00549 0], 'blue', 'FaceAlpha', 0.2);

legend('Stall Speed','Ceiling','Max Speed','Takeoff','Rate of Climb','Feasible Region');
axis([0 7 0 0.15]);
%% =======================
% Wing Geometry Calculation
% =======================

close all;

S = Wto / ws_vs; % Wing area [m^2]
lambda = 0.4; % Taper ratio

b = sqrt(AR * S); % Wingspan

syms ct cr
[cr, ct] = solve(ct - lambda*cr == 0, (ct + cr)/2 * b == S);

ct = double(ct);
cr = double(cr);

fprintf('Wing Area: %.3f m^2\n', S);
fprintf('Wingspan: %.3f m\n', b);
fprintf('Root Chord: %.3f m\n', cr);
fprintf('Tip Chord: %.3f m\n', ct);