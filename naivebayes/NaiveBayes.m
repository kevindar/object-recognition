classdef NaiveBayes

properties
    PDF = 'gaussian' % Probability density function
    name_labels
    n_class
    mu
    sigma
    prior
end
methods
    function obj = NaiveBayes(PDF)
        if nargin > 0
            obj.PDF = PDF;
        end
    end
    function obj = fit(obj,X,Y)
        [obj.name_labels,~,Y] = unique(Y);
        obj.n_class = numel(obj.name_labels);

        % Calculate the means and standard deviations
        obj.mu = zeros(obj.n_class,size(X,2)); obj.sigma = obj.mu;
        for i = 1:obj.n_class
            A = X(Y==i,:);
            obj.mu(i,:) = mean(A);
            obj.sigma(i,:) = std(A,1);
        end

        obj.prior = histc(Y,1:obj.n_class)/numel(Y); % Class prior probability
    end
    function Ypred = predict(obj,Xnew)
        P = size(Xnew,1);
        Ypred = zeros(P,1);
        for i = 1:P
            [~,~,indices] = find(obj,Xnew(i,:)); % Class posterior probability
            Ypred(i) = indices(1); % Label with highest probability
        end

        Ypred = obj.name_labels(Ypred);
    end
    function [Ysorted,probabilities,indices] = find(obj,Xnew)
        meas = repmat(Xnew,obj.n_class,1); % Repeats measurements in a matrix
        if strcmp(obj.PDF,'gaussian')
            p = normpdf(meas,obj.mu,obj.sigma); % Normal distribution
        elseif strcmp(obj.PDF,'exponential')
            p = exppdf(meas,obj.mu); % Exponential distribution
        end
        
        probability = prod([p, obj.prior],2); % Product
        [probabilities,indices] = sort(probability/sum(probability),'descend'); % Ordered probabilities
        Ysorted = obj.name_labels(indices); % Most likely labels
    end
end
end
