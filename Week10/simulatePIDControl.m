function [time, x] = simulatePIDControl(m, c, k, kP, kI, kD, setpoint)
    % Time vector
    dt = 0.01;
    time = 0:dt:10;

    % Pre-allocate output
    x = zeros(size(time));
    v = zeros(size(time));
    lastError = 0;
    integral = 0;

    for i = 2:length(time)
        % Error calculation
        error = setpoint - x(i-1);

        % Proportional term
        P = kP * error;

        % Integral term
        integral = integral + error * dt;
        I = kI * integral;

        % Derivative term
        derivative = (error - lastError) / dt;
        D = kD * derivative;

        % Control signal (force applied)
        adjustment = P + I + D;

        % System dynamics (Euler integration)
        a = (adjustment - c * v(i-1) - k * x(i-1)) / m; % Acceleration
        v(i) = v(i-1) + a * dt; % Velocity update
        x(i) = x(i-1) + v(i) * dt; % Position update

        % Update previous error
        lastError = error;
    end
end