function testProcessGearRatios()
    % Create a test CSV file to simulate input
    driverTeeth = [12; 15; 20];
    drivenTeeth = [24; 30; 60];
    testData = table(driverTeeth, drivenTeeth);
    testFileName = 'test_gear_data.csv';
    testOutputFileName = 'gear_ratios_output.csv';

    % Clean any existing files
    if isfile(testFileName)
        delete(testFileName);
    end
    if isfile(testOutputFileName)
        delete(testOutputFileName);
    end
    
    % Write the test data to a CSV file
    writetable(testData, testFileName);
    
    % Run the processGearRatios function with the test file as input
    processGearRatios(testFileName);  % Pass the filename argument
    
    % Check the output CSV file
    result = readtable(testOutputFileName);
    
    % Validate the gear ratios column
    expectedRatios = [2.00; 2.00; 3.00];
    assert(all(abs(result.gearRatio - expectedRatios) < 1e-6), 'Gear ratios do not match expected values');
    
    % Clean up
    delete(testFileName);
    delete(testOutputFileName);
    
    disp('All tests for processGearRatios passed.');
end