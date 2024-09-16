function testGearRatioCalc()
    % Test cases for gearRatioCalc function
    
    % Test 1: Simple gear pair
    driverTeeth = 12;
    drivenTeeth = 24;
    expectedRatio = 2.00;
    assert(abs(gearRatioCalc(driverTeeth, drivenTeeth) - expectedRatio) < 1e-6);
    
    % Test 2: Another gear pair
    driverTeeth = 15;
    drivenTeeth = 30;
    expectedRatio = 2.00;
    assert(abs(gearRatioCalc(driverTeeth, drivenTeeth) - expectedRatio) < 1e-6);
    
    % Test 3: Different gear pair with larger teeth numbers
    driverTeeth = 20;
    drivenTeeth = 60;
    expectedRatio = 3.00;
    assert(abs(gearRatioCalc(driverTeeth, drivenTeeth) - expectedRatio) < 1e-6);
    
    disp('All tests for gearRatioCalc passed.');
end