% Initial execution of the script takes place here

% Import the train and test datasets
train_set = csvread('train.csv');
test_set = csvread('test.csv');


% Check for Outliers in the training dataset - I have used 1.5-IQR Rule
Iqr = iqr(train_set(:, 1));
third_quantile = quantile(train_set(:, 1), 0.75);
high_outlier = third_quantile + 1.5 * Iqr;  % Training set more than or equal to 
                                           % this threshold can we removed

% Removing the Outliers
train_set = train_set(train_set(:, 1) <= high_outlier, :);

% Visualise the dataset
plot(train_set(:, 1), train_set(:, 2), '*')
hold on;
%
num_rows = size(train_set)(1); 
num_features = size(train_set)(2) - 1;

% Initialise the parameters for the linear hypothesis function
parameters = zeros(num_features+1, 1);
learning_rate = 0.0001;   % Try with different learning rates in powers of 10

% Splitting the trainset by adding a extra variable
x_train = [zeros(num_rows,1), train_set(:,1)];
y_train = train_set(:, 2);

[parameters, j_history] = gradient_descent(x_train, y_train,parameters, 100, learning_rate, num_rows);

% keep track of the cost for each and every iterations. Make sure cost decreases
% after every iterations. If it doesn't, the most obvious reason could be due 
% to large learning rates. In this case scale down the values in powers of 10.

% Plot the linear hypothesis, straight line fit after training - (Kudos! Hehe)
plot(x_train, x_train * parameters);
 
