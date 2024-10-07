% testParticleSimulation.m

% Clear workspace and command window
clc;
clear;

% Simulate particle motion within the test
numParticles = 3;
numTimeSteps = 100;
particles = simulateParticleMotion(numParticles, numTimeSteps);

% Save particle data to a temporary MAT-file
tempDataFile = 'test_particleData.mat';
save(tempDataFile, 'particles');

% Load particle data from the temporary file
load(tempDataFile);

% Delete the temporary file
delete(tempDataFile);

% Calculate average velocities and store in a table
particleIDs = [particles.ID]';
averageVelocities = zeros(numParticles, 1);

for i = 1:numParticles
    averageVelocities(i) = calculateAverageVelocity(particles(i));
end

resultsTable = table(particleIDs, averageVelocities, 'VariableNames', {'ID', 'AverageVelocity'});

% Assertions
assert(height(resultsTable) == numParticles, 'Results table does not have correct number of rows.');
assert(all(resultsTable.AverageVelocity > 0), 'Average velocities should be positive.');

% Plot particle trajectories (optional for test)
figure('Visible', 'off'); % Prevent figure from displaying during test
hold on;
for i = 1:numParticles
    plot3(particles(i).Position(:,1), particles(i).Position(:,2), particles(i).Position(:,3));
end
hold off;
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Particle Trajectories');
legend(arrayfun(@(x) sprintf('Particle %d', x), particleIDs, 'UniformOutput', false));

% Save the figure to a temporary file to verify it was created
tempFigureFile = 'test_particleTrajectories.png';
saveas(gcf, tempFigureFile);

% Check that the figure file exists
assert(isfile(tempFigureFile), 'Particle trajectories figure was not created.');

% Clean up the temporary figure file
delete(tempFigureFile);

disp('testParticleSimulation passed.');