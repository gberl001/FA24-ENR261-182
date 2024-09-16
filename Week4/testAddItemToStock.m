function testAddItemToStock()
    % Test for addItemToStock function

    % Create a temporary test file
    testFile = 'test_inventory.csv';
    cleanup(testFile);

    try
        % Add an item
        addItemToStock(testFile, 123456789012, 'Tomato', 5);
    
        % Read the file and check the content
        inventory = readtable(testFile);
        
        assert(inventory.upc(1) == 123456789012);
        assert(strcmp(inventory.ingredient{1}, 'Tomato'));
        assert(inventory.qty(1) == 5);
    catch ME
        % Clean up
        cleanup(testFile);
        rethrow(ME)
    end
    
    disp('addItemToStock passed.');
end

function cleanup(filename)
    if isfile(filename)
        delete(filename);
    end
end