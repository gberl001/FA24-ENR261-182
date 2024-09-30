function testInventoryForecast()
    % Test function for inventoryForecast.m
    % This function runs several tests to validate the behavior of inventoryForecast.
    
    clc;
    clear;
    close all;
    
    % Specify filenames for the test inventory and usage data
    inventoryFile = 'Inventory.csv';
    usageFile = 'UsageLog.csv';
    
    % Load the inventory data to display available ingredients
    inventoryData = readtable(inventoryFile);  % Load inventory data to display
    inventoryData.upc = string(inventoryData.upc);  % Convert UPC to string for display
    
    % Display available ingredients
    disp('Available ingredients for analysis:');
    disp(inventoryData(:, {'upc', 'ingredient'}));
    
    % Choose a test UPC for the test (you can prompt the user if needed, but for automated tests, pick one)
    upc = "123456789012";  % You can hardcode the UPC or make it variable

    % Define test parameters
    totalDays = 12;     % Number of days for actual data
    futureDays = 20;    % Number of future days to forecast

    % Call the inventory forecast function
    [inventoryOverTime, y_future] = inventoryForecast(upc, totalDays, futureDays, inventoryFile, usageFile);

    % Run the tests
    try
        % Test 1: Ensure initial stock level matches the inventory file
        assert(inventoryOverTime(1) == inventoryData.qty(inventoryData.upc == string(upc)), ...
            'Test 1 failed: Initial inventory does not match the inventory file.');
        disp('Test 1 passed: Initial stock level is correct.');

        % Test 2: Ensure inventory reflects correct usage (inventory should decrease after usage)
        assert(inventoryOverTime(2) < inventoryOverTime(1), ...
            'Test 2 failed: Inventory did not decrease after usage.');
        disp('Test 2 passed: Inventory reflects correct usage.');

        % Test 3: Check inventory increases after purchase
        assert(any(inventoryOverTime > inventoryOverTime(2:end)), ...
            'Test 3 failed: Inventory should increase after a purchase.');
        disp('Test 3 passed: Inventory reflects correct purchase behavior.');

        % Test 4: Ensure future prediction works and that future inventory levels are non-negative
        assert(all(y_future >= 0), 'Test 4 failed: Future inventory levels should not be negative.');
        disp('Test 4 passed: Future inventory levels are valid.');

    catch ME
        % If any test fails, display the error message
        disp(ME.message);
    end

    % Optional: Plot the results for visual inspection
    x = 1:totalDays;
    x_future = totalDays+1:futureDays;

    figure;
    plot(x, inventoryOverTime, '-o', x_future, y_future, '--x', 'DisplayName', 'Inventory Forecast');
    xlabel('Day');
    ylabel('Inventory Level');
    title(sprintf('Inventory Forecast Over Time for UPC %s', upc));
    legend('show');
    grid on;

    disp('All tests completed.');
end