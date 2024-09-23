% testAnalyzeTrajectories.m
% Test script for analyzeTrajectories function

clc;
clear;

% Test data
angles = [0, 30, 45, 60, 90];
ranges = [0, 220, 255, 220, 0];

% Expected values
expectedAverageRange = 139;
expectedMaxRange = 255;
expectedOptimalAngle = 45;
expectedAboveAverageAngles = [30 45 60];

% Call the function
[aboveAverageAngles, maxRange, optimalAngle] = analyzeTrajectories(angles, ranges);

% Assertions
assert(abs(mean(ranges) - expectedAverageRange) < 1e-6, 'Average range calculation error.');
assert(abs(maxRange - expectedMaxRange) < 1e-6, 'Maximum range calculation error.');
assert(optimalAngle == expectedOptimalAngle, 'Optimal angle identification error.');
assert(isequal(aboveAverageAngles, expectedAboveAverageAngles), 'Above-average angles identification error.');

disp('All tests passed for analyzeTrajectories.');