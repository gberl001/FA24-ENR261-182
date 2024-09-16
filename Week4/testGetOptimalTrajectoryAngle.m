function testGetOptimalTrajectoryAngle()
    % Test case 1: Basic scenario with velocity = 50 m/s, initial height = 0 m
    v0 = 50;
    y0 = 0;
    g = 9.81;
    
    [optimal_angle, max_range] = getOptimalTrajectoryAngle(v0, y0, g);
    
    % Test that the optimal angle is in the valid range [0, 90]
    assert(optimal_angle >= 0 && optimal_angle <= 90, ...
        'Error: Optimal angle should be between 0 and 90 degrees');
    
    % Test that the range is non-negative
    assert(max_range >= 0, 'Error: Maximum range should be non-negative');
    
    % Test case 2: Scenario with initial height of 10 meters
    y0 = 10;
    [optimal_angle, max_range] = getOptimalTrajectoryAngle(v0, y0, g);
    
    % Test that the optimal angle is valid and range is non-negative
    assert(optimal_angle >= 0 && optimal_angle <= 90, ...
        'Error: Optimal angle should be between 0 and 90 degrees');
    assert(max_range >= 0, 'Error: Maximum range should be non-negative');
    
    disp('testGetOptimalTrajectoryAngle passed');
end