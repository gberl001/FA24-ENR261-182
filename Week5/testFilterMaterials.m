function testFilterMaterials()

    % Create a temporary test CSV file
    testFilename = 'test_material_properties.csv';
    cleanup(testFilename)

    % Create a test material CSV file
    materialData = {
        'Aluminum', 2700, 300, 1.5;
        'Steel', 7850, 500, 0.8;
        'Titanium', 4500, 900, 12;
        'CarbonFiber', 1600, 3500, 20;
        'Plastic', 950, 50, 0.5;
        };
    
    materialTable = cell2table(materialData, 'VariableNames', {'Material','Density','TensileStrength','CostPerKg'});
    writetable(materialTable, testFilename);


    try
        % Test case 1: Criteria that should return multiple materials
        filteredMaterials = filterMaterials(testFilename, 5000, 200, 15);
        assert(height(filteredMaterials) > 1, 'Test case 1 failed: Expected more than one result');
    
        % Test case 2: Criteria that should return no materials
        filteredMaterials = filterMaterials('material_properties.csv', 1000, 1000, 5);
        assert(isempty(filteredMaterials), 'Test case 2 failed: Expected empty result.');
    
        % Test case 3: Criteria that should return a single material
        filteredMaterials = filterMaterials('material_properties.csv', 5000, 400, 15);
        expectedMaterial = 'Titanium';
        assert(strcmp(filteredMaterials.Material{1}, expectedMaterial), 'Test case 3 failed: Expected Titanium.');
            
        disp('All tests passed for filterMaterials.');
    catch ME
        disp('An error occurred during testing')
        cleanup(testFilename);
    end

    % Clean up the test file
    cleanup(testFilename);
end

function cleanup(filename)
    if isfile(filename)
        delete(filename);
    end
end