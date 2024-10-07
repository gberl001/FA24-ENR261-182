% testSimulateParticleMotion.m

% Clear workspace and command window
clc;
clear;

% Simulate particle motion
numParticles = 2;
numTimeSteps = 50;
particles = simulateParticleMotion(numParticles, numTimeSteps);

% Assertions
assert(length(particles) == numParticles, 'Number of particles does not match.');
assert(length(particles(1).Time) == numTimeSteps, 'Number of time steps does not match.');
assert(size(particles(1).Position, 1) == numTimeSteps, 'Position data does not have correct number of rows.');
assert(size(particles(1).Position, 2) == 3, 'Position data does not have 3 columns.');

disp('testSimulateParticleMotion passed.');