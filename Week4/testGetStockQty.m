function testGetStockQty()
    % Test for getStockQty function

    % Create a temporary test file
    testFile = 'test_inventory.csv';
    cleanup(testFile);

    try
        % Add some items
        addItemToStock(testFile, '123456789012', 'Tomato', 5);
        addItemToStock(testFile, '987654321098', 'Onion', 10);
    
        % Test for existing UPC
        qty = getStockQty(testFile, 123456789012);
        assert(qty == 5);
        
        % Test for non-existing UPC
        qty = getStockQty(testFile, '000000000000');
        assert(qty == -1);
    catch ME
        cleanup(testFile);
        rethrow(ME)
    end

    % Clean up
    cleanup(testFile);
    
    disp('getStockQty passed.');
end

function cleanup(filename)
    if isfile(filename)
        delete(filename);
    end
end