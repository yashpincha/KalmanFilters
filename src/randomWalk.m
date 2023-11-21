%{
A heuristic implementation of a random walk process
Based on Bolviken, E., Christophersen, N., & Storvik, G. (1998). Linear dynamical models, Kalman filtering and
statistics: Lecture notes to IN-ST 259. University of Oslo. https://www.mn.uio.no/math/tjenester/kunnskap/kompendier/komp_kalman.pdf

Q(k − 1) = 1 for k = 1, ..., 50 and = 0.1 for k = 51, ..., 100. Observations are simulated with R(k)=0.5 for all k.
%}

randn('state'); % Initialize the random number generator state

n = 100; % Number of data points

% Define process noise covariance matrix Q
Q = [ones(n/2,1); ones(n/2,1)/10];

% Define measurement noise covariance matrix R
R = ones(n,1)/2;

% Generate process noise w
w = normrnd(zeros(n,1), sqrt(Q));

% Generate a random walk signal x
x = cumsum(w);

% Generate measurement noise z
z = x + normrnd(zeros(n,1), sqrt(R));

% Create an array representing time steps
a = 1:n;

% Plot the random walk signal and the noisy measurement
plot(a, x, a, z);
legend('Random Walk (x)', 'Noisy Measurement (z)');
xlabel('Time Step');
ylabel('Signal Value');
title('Random Walk and Noisy Measurement');
