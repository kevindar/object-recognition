# Naive Bayes (NB) Classifier

[![View Naive Bayes (NB) Classifier on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/76355-naive-bayes-nb-classifier)

Function 
1. NaiveBayes.predict(_)
2. NaiveBayes.find(_)

Description 
1. Returns the estimated labels of one or multiple test instances and the accuracy of the estimates.
2. Returns the labels with their respective probabilities in descending order.

Examples using Iris Data Set

    load fisheriris

    X = meas;
    Y = species;
    Xnew = [min(X);mean(X);max(X)];

    mdl = NaiveBayes('gaussian');
    mdl = mdl.fit(X,Y)
    Ypred = mdl.predict(Xnew)
    
    Ypred =
    
        'setosa'
        'versicolor'
        'virginica'
        
        
    Ynew = {'versicolor';'versicolor';'virginica'};
    accuracy = accuracy_score(Ypred,Ynew)
    
    accuracy =
    
        0.6667

See more examples described in the script files.
