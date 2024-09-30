function testFitStressStrainCurve()
    % Test for Aluminum
    [p, R_squared] = fitStressStrainCurve('Aluminum', 3, false);
    assert(length(p) == 4, 'Polynomial degree does not match');
    assert(R_squared > 0.9, 'R-squared value too low for good fit');
    
    % Test for Steel
    [p, R_squared] = fitStressStrainCurve('Steel', 3, false);
    assert(length(p) == 4, 'Polynomial degree does not match');
    assert(R_squared > 0.9, 'R-squared value too low for good fit');
    
    disp('All tests for fitStressStrainCurve passed.');
end