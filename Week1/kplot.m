% Kitchen Inventory Management System
% This script tracks stock levels of kitchen items over 3 days and visualizes them with a plot.

% Step 1: Initialize vectors for stock levels of three items over 3 days
items = ["Flour", "Sugar", "Salt"]; % Kitchen items

% Stock levels for each item (one vector for each item, corresponding to 3 days)
flourStock = [10, 8, 6];   % Stock of flour on Day 1, Day 2, Day 3
sugarStock = [15, 14, 13]; % Stock of sugar on Day 1, Day 2, Day 3
saltStock = [5, 5, 4];     % Stock of salt on Day 1, Day 2, Day 3

% Step 2: Plot the stock levels for each item over the 3 days
days = [1, 2, 3]; % Vector representing Day 1, Day 2, and Day 3

% Plot each item's stock levels
plot(days, flourStock, '-o');  % Plot flour stock levels with circles
hold on;                       % Hold the current plot to overlay the next plots
plot(days, sugarStock, '-x');   % Plot sugar stock levels with x markers
plot(days, saltStock, '-*');    % Plot salt stock levels with star markers
hold off;                      % Release the plot hold

% Add labels and a title
xlabel('Days');                    % Label for the x-axis
ylabel('Stock Level');             % Label for the y-axis
title('Stock Levels Over 3 Days'); % Title for the plot
