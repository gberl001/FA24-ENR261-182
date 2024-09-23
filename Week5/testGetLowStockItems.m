function testGetLowStockItems()
% testGetLowStockItems.m
% Test script for getLowStockItems function

    filename = 'test_inventory.csv';

    % Clean up
    cleanup(filename)
    
    % Create a test inventory CSV file
    inventoryData = {
        123456789012, 'Tomato', 3;
        987654321098, 'Onion', 2;
        555555555555, 'Garlic', 10;
        111111111111, 'Basil', 5;
        };
    
    try
        inventoryTable = cell2table(inventoryData, 'VariableNames', {'upc', 'ingredient', 'qty'});
        writetable(inventoryTable, filename);
    
        % Test case: Threshold of 5
        threshold = 5;
        lowStockItems = getLowStockItems(filename, threshold);
        expectedUPCs = [123456789012; 987654321098; 111111111111];
        assert(isequal(lowStockItems.upc, expectedUPCs), 'Test case failed: Low-stock items do not match expected.');
    
        disp('All tests passed for getLowStockItems.');
    catch ME
        disp('An error occurred during testing')
        % Clean up
        cleanup(filename)
    end
    
    % Clean up
    cleanup(filename)

end

function cleanup(filename)
    if isfile(filename)
        delete(filename);
    end
end