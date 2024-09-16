function testGetInventoryList()
    % Test for getInventoryList function

    % Create a temporary test file
    testFile = 'test_inventory.csv';
    cleanup(testFile);

    try
        % Add some items
        addItemToStock(testFile, 123456789012, 'Tomato', 5);
        addItemToStock(testFile, 987654321098, 'Onion', 10);
    
        % Test inventory list
        inventory = getInventoryList(testFile);
        
        assert(inventory.upc(1) == 123456789012);
        assert(strcmp(inventory.ingredient{2}, 'Onion'));
        assert(inventory.qty(2) == 10);
    catch
        cleanup(testFile);
        rethrow(ME)
    end

    % Clean up
    cleanup(testFile);
    
    disp('getInventoryList passed.');
end

function cleanup(filename)
    if isfile(filename)
        delete(filename);
    end
end