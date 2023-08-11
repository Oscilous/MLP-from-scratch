function [input_train, output_train, input_test, output_test] = train_test_split(data, inputs, outputs, ratio)
    % Store size of the dataset as variables
    [numRows,numCols] = size(data);
    % First we randomize our dataset
    data = data(:,randperm(numCols));
    % Preform the split
    input_train = data(1:inputs , 1:numCols * ratio);
    output_train = data((inputs + 1):end , 1:numCols * ratio);
    input_test = data(1:inputs , (numCols * ratio + 1): end);
    output_test = data((inputs + 1):end , (numCols * ratio + 1): end);
end