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

function accuracy = calculateAccuracy(y_test, y_pred)
    % Ensure y_test and y_pred have the same size
    if numel(y_test) ~= numel(y_pred)
        error('Input arrays must have the same size.');
    end
    
    % Convert to binary (0 or 1) for comparison
    for prediction = 1 : size(y_pred, 2)
        if y_pred(prediction) >= 0.5
            y_pred(prediction) = 1;
        end
        if y_pred(prediction) < 0.5
            y_pred(prediction) = 0;
        end
    end
    % Calculate accuracy
    correct_predictions = sum(y_test == y_pred);
    total_predictions = numel(y_test);
    
    accuracy = correct_predictions / total_predictions;
end