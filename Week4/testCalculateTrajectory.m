function testCalculateTrajectory()
    % Test case 1: Basic scenario with velocity = 50 m/s, angle = 45 degrees
    v0 = 50;
    angle = 45;
    g = 9.81;
    numValues = 100;
    
    [x, y, time] = calculateTrajectory(v0, angle, g, numValues);
    
    % Test that the time values are non-negative and increase monotonically
    assert(all(time >= 0), 'Error: Time values should be non-negative');
    assert(issorted(time), 'Error: Time values should be monotonically increasing');
    
    % Test that x and y values are non-negative and that y hits zero at the end
    assert(all(x >= 0), 'Error: Horizontal position values should be non-negative');
    assert(all(y >= 0), 'Error: Vertical position values should be non-negative');
    
    % Ensure that the final y value is near zero (projectile hitting the ground)
    assert(abs(y(end)) < 1e-6, 'Error: The final y value should be close to 0');
    
    disp('testCalculateTrajectory passed');
end