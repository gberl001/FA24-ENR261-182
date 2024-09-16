function testProjectileComparisonAssignment()
    % Test case 1: Basic scenario
    v0 = 50;
    y0 = 10;
    guess = 45;
    
    % Run the test version of the script
    testProjectileComparison(v0, y0, guess);
    
    % Test case 2: Higher velocity, different guess
    v0 = 80;
    y0 = 0;
    guess = 60;
    
    % Run the test version of the script
    testProjectileComparison(v0, y0, guess);
    
    % Test case 3: Low velocity with an initial height
    v0 = 20;
    y0 = 5;
    guess = 30;
    
    % Run the test version of the script
    testProjectileComparison(v0, y0, guess);
    
    disp('All projectileComparison tests passed');
end