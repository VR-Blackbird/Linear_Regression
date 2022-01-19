function [parameters,j_history] = gradient_descent(x,y,params,num_iterations,learning_rate,n)
% Description : Used to calculate the optimal value for the parameters to fit a
%               perfect straight line at global optimum.
% Input : Takes the input values of dependent and independent variables, number
%         of iterations required, learning rate to be used and total number of 
%         training sets.
% Output : The values which are obtained are, 
%          1. Optimal value for the parameters(parameters).
%          2. Cost at every iterations as a vector(j_history). 
  parameters = params;
  j_history = zeros(1, num_iterations);
  for iterations=1:num_iterations
    h = x * parameters; % Linear Hypothesis function. 
    parameters = parameters - ((learning_rate/n)*(x' *(h-y)));% Gradient descent
    j_history(iterations) = costFunction(x, y, h, n);
  endfor

end