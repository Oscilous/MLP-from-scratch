classdef MLP
    properties
        hidden_layer_size
        ji_weights
        kj_weights
        input_amount
        output_amount
        u
        x
        v

    end

    methods
        % Constructor
        function obj = MLP(hidden_layer_neurons)
            obj.hidden_layer_size = hidden_layer_neurons;
        end
        function obj = fit(obj, X_train, y_train)
            obj.u = X_train;
            
            obj.input_amount = size(X_train, 1);
            obj.output_amount = size(y_train, 1);

            obj.ji_weights = rand(obj.input_amount, obj.hidden_layer_size);
            obj.kj_weights = rand(obj.hidden_layer_size, obj.output_amount);
            
            obj.x = zeros(1, obj.hidden_layer_size);

            %Feed Forward
            %for cols = 1 : size(obj.u, 1)
                for hidden_node = 1 : obj.hidden_layer_size
                    sum = 0;
                    for rows = 1:obj.input_amount
                         sum = sum + obj.u(rows, 1) * obj.ji_weights(rows, hidden_node);
                    end
                    obj.x(hidden_node) = Sigmoid_AF(sum);
                end

                for output_node = 1 : obj.output_amount
                    sum = 0;
                    for rows = 1:obj.hidden_layer_size
                         sum = sum + obj.x(1, rows) * obj.kj_weights(rows, output_node);
                    end
                    obj.v(output_node) = Sigmoid_AF(sum);
                end
            %end
        end
    end
end

function result = Sigmoid_AF(x)
            result = 1/(1+exp(-x));
end