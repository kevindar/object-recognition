%Examples using Iris Data Set

load fisheriris

X = meas;
Y = species;
Xnew = [min(X);mean(X);max(X)];
PDF = 'gaussian'; % There are 2 types of options: 'gaussian' and 'exponential'

mdl = NaiveBayes(PDF);
mdl = mdl.fit(X,Y)
Ypred = mdl.predict(Xnew)

Ynew = {'versicolor';'versicolor';'virginica'};
accuracy = accuracy_score(Ypred,Ynew)
