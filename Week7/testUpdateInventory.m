% testUpdateInventory.m

% Clear workspace and command window
clc;
clear;

% Create initial inventory table
inventory = table({'Flour'; 'Eggs'; 'Milk'}, [500; 6; 1000], {'grams'; 'pieces'; 'ml'}, ...
    'VariableNames', {'Name', 'Quantity', 'Unit'});

% Define a recipe within the test script
recipe = {
    'Pancakes', ...
    {
        struct('Name', 'Flour', 'Quantity', 200, 'Unit', 'grams'), ...
        struct('Name', 'Eggs', 'Quantity', 2, 'Unit', 'pieces'), ...
        struct('Name', 'Milk', 'Quantity', 300, 'Unit', 'ml')
    }
};

% Update inventory using the function
updatedInventory = updateInventory(inventory, recipe);

% Expected quantities after update
expectedQuantities = [300; 4; 700];

assert(isequal(updatedInventory.Quantity, expectedQuantities), 'Updated quantities do not match expected values.');

disp('testUpdateInventory passed.');