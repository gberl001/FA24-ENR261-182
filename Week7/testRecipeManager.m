% testRecipeManager.m

% Clear workspace and command window
clc;
clear;

% Create initial inventory and save to a temporary CSV file
inventory = table({'Flour'; 'Eggs'; 'Milk'; 'Cheese'; 'Salt'}, [1000; 10; 1000; 150; 50], {'grams'; 'pieces'; 'ml'; 'grams'; 'grams'}, ...
    'VariableNames', {'Name', 'Quantity', 'Unit'});
tempInventoryFile = 'test_ingredientInventory.csv';
writetable(inventory, tempInventoryFile);

% Replace the inventory filename in the student's script if needed
% Assuming the script uses a variable 'inventoryFileName'
inventoryFileName = tempInventoryFile;

% Run the main script or simulate its steps within the test
% For this example, we'll simulate the steps:

% Load inventory from the temporary file
inventory = readtable(inventoryFileName);

% Define the recipe within the test
recipe = {
    'Pancakes', ...
    {
        struct('Name', 'Flour', 'Quantity', 200, 'Unit', 'grams'), ...
        struct('Name', 'Eggs', 'Quantity', 2, 'Unit', 'pieces'), ...
        struct('Name', 'Milk', 'Quantity', 300, 'Unit', 'ml')
    }
};

% Update inventory
updatedInventory = updateInventory(inventory, recipe);

% Save updated inventory back to the temporary file
writetable(updatedInventory, inventoryFileName);

% Load the updated inventory
updatedInventory = readtable(inventoryFileName);

% Clean up the temporary file
delete(inventoryFileName);

% Expected inventory after updates
expectedNames = {'Flour'; 'Eggs'; 'Milk'; 'Cheese'; 'Salt'};
expectedQuantities = [800; 8; 700; 150; 50];

% Assertions
assert(isequal(updatedInventory.Name, expectedNames), 'Inventory names do not match expected values.');
assert(isequal(updatedInventory.Quantity, expectedQuantities), 'Inventory quantities do not match expected values.');

disp('testRecipeManager passed.');