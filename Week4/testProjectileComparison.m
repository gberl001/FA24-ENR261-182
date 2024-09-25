function testProjectileComparison(v0, y0, guess)
    % Modified version of projectileComparison script for testing
    g = 9.81;       % Gravity (m/s^2)
    numValues = 100; % Number of time intervals

    % Step 1: Compute the optimal angle and maximum range
    [optimal_angle, max_range] = getOptimalTrajectoryAngle(v0, y0, guess);

    % Step 2: Compute the trajectory for both the guessed angle and the optimal angle
    [x_optimal, y_optimal] = calculateTrajectory(v0, optimal_angle, y0, g, numValues);
    [x_guess, y_guess] = calculateTrajectory(v0, guess, y0, g, numValues);

    % Test outputs
    assert(optimal_angle >= 0 && optimal_angle <= 90, ...
        'Error: Optimal angle should be between 0 and 90 degrees');
    assert(max_range >= 0, 'Error: Maximum range should be non-negative');
    assert(all(x_optimal >= 0), 'Error: Optimal trajectory x-values should be non-negative');
    assert(all(y_optimal >= 0), 'Error: Optimal trajectory y-values should be non-negative');
    assert(all(x_guess >= 0), 'Error: Guessed trajectory x-values should be non-negative');
    assert(all(y_guess >= 0), 'Error: Guessed trajectory y-values should be non-negative');

    % Ensure the final y values for both trajectories are close to zero
    assert(abs(y_optimal(end)) < 1e-6, 'Error: The final y value for optimal angle should be close to 0');
    assert(abs(y_guess(end)) < 1e-6, 'Error: The final y value for guessed angle should be close to 0');

    % Test how close the guess is to the optimal angle
    if abs(guess - optimal_angle) < 1
        disp('Good guess! Your angle is very close to the optimal angle.');
    else
        fprintf('Your guess was off by %.2f degrees.\n', abs(guess - optimal_angle));
    end
    
    disp('projectileComparisonTest passed');
end