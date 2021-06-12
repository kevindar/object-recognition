%Examples using Iris Data Set with FIND

load fisheriris

X = meas;
Y = species;
Xnew = median(X);
PDF = 'gaussian'; % There are 2 types of options: 'gaussian' and 'exponential'

mdl = NaiveBayes(PDF);
mdl = mdl.fit(X,Y)
[Ysorted,probabilities] = mdl.find(Xnew)
