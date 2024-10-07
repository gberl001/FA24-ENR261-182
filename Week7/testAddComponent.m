% testAddComponent.m

% Clear workspace and command window
clc;
clear;

% Initialize empty components array
components = struct('ID', {}, 'Name', {}, 'Dimensions', {}, 'Material', {}, 'Weight', {});

% Define a component
component.ID = 1;
component.Name = 'Beam';
component.Dimensions.Length = 2.5;
component.Dimensions.Width = 0.3;
component.Dimensions.Height = 0.5;
component.Material = 'Steel';
component.Weight = 150.0;

% Add component using the function
components = addComponent(components, component);

% Assert that the component was added correctly
assert(length(components) == 1, 'Component was not added.');
assert(components(1).ID == component.ID, 'ID does not match.');
assert(strcmp(components(1).Name, component.Name), 'Name does not match.');
assert(components(1).Dimensions.Length == component.Dimensions.Length, 'Length does not match.');
assert(strcmp(components(1).Material, component.Material), 'Material does not match.');

disp('testAddComponent passed.');