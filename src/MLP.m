classdef MLP
    properties
        learning_rate
        hidden_layer_size
        ji_weights
        kj_weights
        input_amount
        output_amount
        u
        x
        v
        v_pred
    end

    methods
        % Constructor
        function obj = MLP(hidden_layer_neurons, learning_rate)
            obj.hidden_layer_size = hidden_layer_neurons;
            obj.learning_rate = learning_rate;
        end
        function obj = fit(obj, X_train, y_train, iterations)
            obj.u = [X_train; -1 * ones(1, size(X_train,2))];
            obj.v_pred = y_train;
            
            obj.input_amount = size(X_train, 1);
            obj.output_amount = size(y_train, 1);

            % +1 for the later added bias term
            obj.ji_weights = rand(obj.input_amount + 1, obj.hidden_layer_size);
            obj.kj_weights = rand(obj.hidden_layer_size + 1, obj.output_amount);
            
            obj.x = zeros(1, obj.hidden_layer_size);
            obj.x = [obj.x -1];
            plot_error = [];
            i = 0;

            for iteration = 1 : iterations
                % Iterate thru whole training set
                for cols = 1 : size(obj.u, 2)
                    %Feed Forward
                    % u -> x
                    for hidden_node = 1 : obj.hidden_layer_size
                        sum = 0;
                        for rows = 1:size(obj.u, 1)
                             sum = sum + obj.u(rows, cols) * obj.ji_weights(rows, hidden_node);
                        end
                        obj.x(hidden_node) = Sigmoid_AF(sum);
                    end
                    % x -> y
                    for output_node = 1 : obj.output_amount
                        sum = 0;
                        for rows = 1:obj.hidden_layer_size + 1
                             sum = sum + obj.x(1, rows) * obj.kj_weights(rows, output_node);
                        end
                        obj.v(output_node) = Sigmoid_AF(sum);
                    end
    
                    % Error gradient for all output neurons
                    for output_node = 1 : obj.output_amount
                        output_node_error(output_node) = obj.v(output_node) * (1 - obj.v(output_node)) * (obj.v_pred(cols) - obj.v(output_node));
                    end
                    plot_error = [plot_error, i++ output_node_error];
        
    
                    % Error gradient for all hidden neurons
                    for hidden_node = 1 : obj.hidden_layer_size + 1
                        weighted_error = 0;
                        for output_node = 1 : obj.output_amount
                            weighted_error = weighted_error + output_node_error(output_node) * obj.kj_weights(hidden_node, output_node);
                        end
                        hidden_node_error(hidden_node) = obj.x(hidden_node) * (1- obj.x(hidden_node)) * weighted_error(output_node);
                    end
                    
                    % Update weights based on error
                    % ji_weights update
                    for hidden_node = 1 : obj.hidden_layer_size
                        for rows = 1:obj.input_amount + 1
                             obj.ji_weights(rows, hidden_node) = obj.ji_weights(rows, hidden_node) + obj.learning_rate * hidden_node_error(hidden_node) * obj.u(rows);
                        end
                    end
                    % kj_weights update
                    for output_node = 1 : obj.output_amount
                        for rows = 1:obj.hidden_layer_size + 1
                             obj.kj_weights(rows, output_node) = obj.kj_weights(rows, output_node) + obj.learning_rate * output_node_error(output_node) * obj.x(rows);
                        end
                    end
                end
            end
            plot(plot_error);
        end
        function prediction = predict(obj, X_test)
            obj.u = [X_test; -1 * ones(1, size(X_test,2))];
            
            obj.x = zeros(1, obj.hidden_layer_size);
            obj.x = [obj.x -1];
            % Iterate thru whole training set
            for cols = 1 : size(obj.u, 2)
                %Feed Forward
                % u -> x
                for hidden_node = 1 : obj.hidden_layer_size
                    sum = 0;
                    for rows = 1:size(obj.u, 1)
                         sum = sum + obj.u(rows, cols) * obj.ji_weights(rows, hidden_node);
                    end
                    obj.x(hidden_node) = Sigmoid_AF(sum);
                end
                % x -> y
                for output_node = 1 : obj.output_amount
                    sum = 0;
                    for rows = 1:obj.hidden_layer_size + 1
                         sum = sum + obj.x(1, rows) * obj.kj_weights(rows, output_node);
                    end
                    obj.v(output_node) = Sigmoid_AF(sum);
                    temp(cols) = obj.v(output_node);                    
                end
            end
            prediction = temp;
        end
    end
end

function result = Sigmoid_AF(x)
    result = 1/(1+exp(-x));
end

