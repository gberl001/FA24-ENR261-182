function [time, sensorReading, leftMotorSpeed, rightMotorSpeed, position] = simulateLineFollowerPololu(kP, kI, kD, setpoint, randomSeed)
    % Time Vector
    dt = 0.1;
    time = 0:dt:10;

    % Set the random seed
    if nargin > 4 && ~isempty(randomSeed)
        rng(randomSeed);
    else
        % Shuffle the generator
        rng('shuffle');
    end

    % PID variables
    integral = 0;
    lastError = 0;

    % Robot parameters
    setSpeed = 150;
    maxSpeed = 255;
    minSpeed = 0;

    % Initial values
    sensorReading = zeros(size(time));
    sensorReading(1) = setpoint;

    % Motor speed arrays
    leftMotorSpeed = zeros(size(time));
    rightMotorSpeed = zeros(size(time));
    leftMotorSpeed(1) = setSpeed;
    rightMotorSpeed(1) = setSpeed;

    % Simulate line following
    for i = 2:length(time)
        % Small deviations to simulate a dynamic line following, drift, etc
        sensorReading(i) = sensorReading(i-1) + 25 * (rand - 0.5);

        % Large deviations to simulate turns, etc
        if mod(i, 50) == 0 % Every 5 seconds, introduce a bigger deviation
            sensorReading(i) = setpoint + 200 * (rand - 0.5); % Bigger random deviation
        end

        % Limit the reading to acceptable values (range is 0 to 7000)
        sensorReading(i) = max(min(sensorReading(i), 7000), 0);

        % Calculate adjustment
        error = setpoint - sensorReading(i);
        integral = integral + error*dt;
        derivative = (error - lastError)/dt;
        adjustment = kP * error + kI * integral + kD * derivative;

        % Adjust motor speeds
        leftMotorSpeed(i) = setSpeed + adjustment;
        rightMotorSpeed(i) = setSpeed - adjustment;

        % Limit motor speeds to usable range
        leftMotorSpeed(i) = max(min(leftMotorSpeed(i), maxSpeed), minSpeed);
        rightMotorSpeed(i) = max(min(rightMotorSpeed(i), maxSpeed), minSpeed);

        % Update previous error
        lastError = error;
    end

    position = cumsum((leftMotorSpeed - rightMotorSpeed));
end