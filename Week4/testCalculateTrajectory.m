function testCalculateTrajectory()
    % Test case 1: Basic scenario with velocity = 50 m/s, angle = 45 degrees, initial height = 10 meters
    v0 = 50;
    angle = 45;
    g = 9.81;
    y0 = 10;
    numValues = 100;
    
    [x, y, time] = calculateTrajectory(v0, angle, y0, g, numValues);
    
    % Test that the time values are non-negative and increase monotonically
    assert(all(time >= 0), 'Error: Time values should be non-negative');
    assert(issorted(time), 'Error: Time values should be monotonically increasing');
    
    % Test that x values are non-negative
    assert(all(x >= 0), 'Error: Horizontal position values should be non-negative');
    
    % Test that y values are greater than or equal to the initial height at the start
    assert(y(1) >= y0, 'Error: Initial vertical position should be greater than or equal to the initial height');
    
    % Test that y values do not fall below zero (projectile does not go underground)
    assert(all(y >= 0), 'Error: Vertical position values should be non-negative');
    
    % Ensure that the final y value is near zero (projectile hitting the ground)
    assert(abs(y(end)) < 1e-6, 'Error: The final y value should be close to 0');
    
    disp('testCalculateTrajectory passed');
end