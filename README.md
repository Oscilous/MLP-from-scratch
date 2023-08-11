# Multi-Layer Perceptron (MLP) Implementation in MATLAB

The Multi-Layer Perceptron (MLP) is a foundational neural network architecture used for various machine learning tasks. This from scratch MATLAB implementation provides a basic framework for constructing and training an MLP.

## Table of Contents

- [Overview](#overview)
- [Usage](#usage)
- [Class Structure](#class-structure)
- [Example](#example)
- [Contributing](#contributing)
- [License](#license)

## Overview

This MATLAB implementation provides a basic framework for constructing and training a Multi-Layer Perceptron (MLP) using an Object-Oriented Programming (OOP) approach.

The MLP is a foundational neural network architecture used for various machine learning tasks. In this implementation, the MLP class is defined, allowing you to create and train a simple multi-layer neural network. The class provides methods for fitting the network to data, performing feedforward computations, and applying a sigmoid activation function.


## Usage

To use the MLP class, follow these steps:

1. Download or clone the MLP MATLAB files to your local machine.

2. Ensure that the MLP class file (`MLP.m`) is located in the same directory as your MATLAB script.

3. Open your MATLAB script (or example file `main.m`) and use the MLP class.

4. Run your MATLAB script (`main.m`) to see the MLP implementation in action.

**Note:** In the above code, the `addpath(pwd)` command adds the current directory (where `main.m` and `MLP.m` are located) to the MATLAB path. This step allows MATLAB to locate and use the `MLP` class definition. If location of `MLP.m` is changed, make sure to change `addpath(/path/to/MLP)` accordingly.


## Class Structure

The MLP class has the following properties:

- `hidden_layer_size`: Number of neurons in the hidden layer.
- `ji_weights`: Weight matrix for the connections between the input and hidden layers.
- `kj_weights`: Weight matrix for the connections between the hidden and output layers.
- `input_amount`: Number of input features.
- `output_amount`: Number of output features.

The class includes the following methods:

- `fit(X_train, y_train)`: Fit the MLP to the training data.
- `FeedForward(input_data, input)`: Perform feedforward computation.
- `Sigmoid_AF(x)`: Apply the sigmoid activation function.
- `Calculate_node(w, x)`: Calculate the activation of a node.

## Example

```matlab
% Create an instance of the MLP class
hidden_layer_neurons = 10;
mlpInstance = MLP(hidden_layer_neurons);

% Load your training data (X_train, y_train)

% Fit the MLP to the training data
mlpInstance.fit(X_train, y_train);

% Perform feedforward computation
input_data = ...; % Your input data
output = mlpInstance.FeedForward(input_data);

% Display the output
disp(output);
```
## Contributing

Contributions are welcome! If you find any issues or want to enhance the functionality of this MLP implementation, please feel free to submit a pull request.

## License

This implementation is provided under the MIT License.
