clear all
close all

addpath(pwd);

% Cols - single event
% from 1 to input_amount - inputs
% from input_amount + 1 to end - outputs
dataset = [
    1 0 1 0 1 1 1 0 0 0 1 1 1 1 1,
    1 1 0 0 0 1 0 1 0 0 1 1 1 1 1,
    1 0 0 0 0 1 0 0 0 0 1 1 1 1 1
];

dataset = importdata("AND_gate_dataset.csv");

% MLP parameters
input_amount = 2;
output_amount = 1;
max_iterations = 10;
learning_rate = 0.9;
hidden_layer_neurons = 1;

[X_train, y_train, X_test, y_test] = train_test_split(dataset, input_amount, output_amount ,0.9);

myMLP = MLP(hidden_layer_neurons, learning_rate);
myMLP = myMLP.fit(X_train, y_train, max_iterations);
X_test = [
    0 1 0 1,
    0 0 1 1,
]
y_test = [0 0 0 0 0 0 1 1];
y_pred = myMLP.predict(X_test);

y_pred
y_test