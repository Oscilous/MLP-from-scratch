clear all
close all

addpath(pwd);

% Cols - single event
% from 1 to input_amount - inputs
% from input_amount + 1 to end - outputs
dataset = [
    1 0 1 0 1 1 1 0 0 0,
    1 1 0 0 0 1 0 1 0 0,
    1 0 0 0 0 1 0 0 0 0
];

dataset = [
    1 1 1 1 1 1 1 1 1 1,
    1 1 1 1 1 1 1 1 0 1,
    1 0 0 0 0 1 0 0 0 0
];

% MLP parameters
input_amount = 2;
output_amount = 1;
max_iterations = 10;
hidden_layer_neurons = 5;

[X_train, y_train, X_test, y_test] = train_test_split(dataset, input_amount, output_amount ,0.8);

myMLP = MLP(hidden_layer_neurons);
myMLP.fit(X_train, y_train);