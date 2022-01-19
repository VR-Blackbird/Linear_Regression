function costJ = costFunction(x, y, hypothesis, num_trainset)
% Description : Used to calculate the cost(penalty)
% 
% Input : Takes input values of independent and dependent variables (x and y),
%         Hypothesis function value (hypothesis), Number of training sets (num_trainset)
%
% Output : Outputs the calculated cost function 'Mean Squared Cost Function' (costJ)
% 
costJ = (1/(2 * num_trainset)) * sum((hypothesis - y).^2) 
    
end