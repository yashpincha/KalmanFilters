function [x,z] = sim_ekf_1(Q,R,m0,P0,N)
% Author: Yash Pincha
% Summary: Simulates measured (Gaussian) data for Bolviken Ex7 (page 133)
%          without predicting parameter base
%          https://www.mn.uio.no/math/tjenester/kunnskap/kompendier/komp_kalman.pdf

% Inputs: Q = var[w(k)]; 0.01 in this example
%         R = var[v(k)]; 0.02 in this example
%         m0 = mean; 2 in this example
%         P0 = variance; 1 in this example
%         N = number of values produced; 50 in this example
% Note:   w(k) is random term in x(k)
%         v(k) is error term in z(k)
% Output: x = simulated data for true state values
%         z = simulated data for measured state values

% Randomly set initial value of state with distribution N(m0,sqrt(P0))
x0 = normrnd(m0, sqrt(P0)); % m0 = mean, P0 = standard deviation
x = zeros(N,1); % Initializing true state vector with zeros
z = zeros(N,1); % Initializing measured state vector with zeros

% Defining initial state for x(k) equation with normally distributed noise
x(1) = x0(1) + normrnd(0, sqrt(Q));

% Defining initial state for z(k) equation with normally distributed noise
z(1) = x0(1) + normrnd(0, sqrt(R));

% Iterate through each time step to create simulated values for states
for k=2:N
    % Calculate state at time step k for x(k) equation
    % with normally distributed noise
    x(k) = x(k-1) + normrnd(0, sqrt(Q));
    
    % Calculate state at time step k for z(k) equation
    % with normally distributed noise
    z(k) = x(1) + normrnd(0, sqrt(R));
end

% Store simulated data in csv file for reproducible results
csvwrite('true_data.csv', x); % true state data (x)
csvwrite('measured_data.csv',z); % measurement state data (z)

end
