% testConvertToTable.m

% Clear workspace and command window
clc;
clear;

% Initialize components array with two components
components(1).ID = 1;
components(1).Name = 'Beam';
components(1).Dimensions.Length = 2.5;
components(1).Dimensions.Width = 0.3;
components(1).Dimensions.Height = 0.5;
components(1).Material = 'Steel';
components(1).Weight = 150.0;

components(2).ID = 2;
components(2).Name = 'Column';
components(2).Dimensions.Length = 3.0;
components(2).Dimensions.Width = 0.4;
components(2).Dimensions.Height = 0.4;
components(2).Material = 'Concrete';
components(2).Weight = 200.0;

% Convert to table using the function
componentTable = struct2Table(components);

% Assert that the table has correct size
assert(height(componentTable) == 2, 'Table does not have correct number of rows.');
assert(width(componentTable) == 7, 'Table does not have correct number of columns.');

% Assert that the data matches
assert(componentTable.ID(1) == components(1).ID, 'ID does not match.');
assert(strcmp(componentTable.Name{1}, components(1).Name), 'Name does not match.');

disp('testConvertToTable passed.');