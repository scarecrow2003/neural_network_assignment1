clc
close all
clear all
x = [1, 0; 1, 0.8; 1, 1.6; 1, 3; 1, 4.0; 1, 5.0];
d = [0.5, 1, 4, 5, 6, 8];
epoch = 100;
rate = 0.0001;
w = [ones(1, 2); zeros(4, 2)];
e = zeros(5);
xtest = 0:0.01:5;
hold on;
for i=1:5
    plot(x(i, 2), d(i), 'b+');
end
for i=1:epoch
    for j=1:5
        e(j) = d(j) - w(j, :) * x(j, :)';
        w(j+1, :) = w(j, :) + rate * e(j) * x(j);
    end
    w(1, :) = w(5, :);
end
ytest = w(1, 2) * xtest + w(1, 1);
plot(xtest, ytest);
text(3, 2, strcat('w=', num2str(w(1, 2)), ' b=', num2str(w(1, 1))));
err = 0;
for i=1:5
   e(i) = d(i) - w(1, :) * x(i, :)';
   err = err + e(i)^2;
end
text(3, 1, strcat('cost = ', num2str(err)));
hold off;
