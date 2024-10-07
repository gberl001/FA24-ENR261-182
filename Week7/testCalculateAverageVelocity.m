% testCalculateAverageVelocity.m

% Clear workspace and command window
clc;
clear;

% Create a test particle with known motion
particle.ID = 1;
particle.Time = [0; 1; 2];
particle.Position = [0, 0, 0; 1, 1, 1; 2, 2, 2];

% Calculate average velocity
avgVelocity = calculateAverageVelocity(particle);

% Expected average velocity
expectedVelocity = sqrt(3);

% Assertion
assert(abs(avgVelocity - expectedVelocity) < 1e-6, 'Average velocity does not match expected value.');

disp('testCalculateAverageVelocity passed.');