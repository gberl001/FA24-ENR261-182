% Calculate the sum of even numbers between 1 and 100 using a while loop
% and incrementing i by 2 to visit each even number.
sum_even = 0;
i = 2;
while i <= 100
    sum_even = sum_even + i;
end
fprintf('The sum of even numbers between 1 and 100 is: %d\n', sum_even);