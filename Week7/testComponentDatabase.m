% testComponentDatabase.m

% Clear workspace and command window
clc;
clear;

% Add components to the database
components = struct('ID', {}, 'Name', {}, 'Dimensions', {}, 'Material', {}, 'Weight', {});

component1.ID = 1;
component1.Name = 'Beam';
component1.Dimensions.Length = 2.5;
component1.Dimensions.Width = 0.3;
component1.Dimensions.Height = 0.5;
component1.Material = 'Steel';
component1.Weight = 150.0;

component2.ID = 2;
component2.Name = 'Column';
component2.Dimensions.Length = 3.0;
component2.Dimensions.Width = 0.4;
component2.Dimensions.Height = 0.4;
component2.Material = 'Concrete';
component2.Weight = 200.0;

component3.ID = 3;
component3.Name = 'Bolt';
component3.Dimensions.Length = 0.1;
component3.Dimensions.Width = 0.02;
component3.Dimensions.Height = 0.02;
component3.Material = 'Alloy';
component3.Weight = 0.5;

% Test addComponent function
components = addComponent(components, component1);
components = addComponent(components, component2);
components = addComponent(components, component3);

% Test convertToTable function
componentTable = struct2Table(components);

tempFileName = 'test_componentsDatabase.csv';

% Save the table to CSV
writetable(componentTable, tempFileName);

% Load the table back
loadedTable = readtable(tempFileName);

% Display the loaded table
disp('Loaded Components Database:');
disp(loadedTable);

delete(tempFileName);

% Verify that the loaded table matches the original table
% Expected data
expectedIDs = [1; 2; 3];
expectedNames = {'Beam'; 'Column'; 'Bolt'};

% Assertions
assert(height(loadedTable) == 3, 'Loaded table does not have correct number of rows.');
assert(isequal(loadedTable.ID, expectedIDs), 'IDs do not match expected values.');
assert(isequal(loadedTable.Name, expectedNames), 'Names do not match expected values.');
assert(isequal(componentTable, loadedTable), 'The loaded table does not match the original table.')