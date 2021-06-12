function accuracy = accuracy_score(Ypred,Ynew)
[name_labels,~,Ypred] = unique(Ypred); % Numeric predicted labels
[~,Ynew] = ismember(Ynew,name_labels); % Numeric new labels
accuracy = mean(Ypred == Ynew); % calculated accuracy
end
