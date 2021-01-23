dataset=read.csv('50_Startups.csv')
dataset$State=factor(dataset$State,
                     levels = c('New York','California','Florida'),
                     labels=c(1,2,3))
library(caTools)
set.seed(123)
spl=sample.split(dataset$Profit,SplitRatio= 2/3)
training_set=subset(dataset,spl==TRUE)
test_set=subset(dataset,spl==FALSE)

#regressor =lm(formula = Profit ~ R.D.Spend+ Administration + Marketing.Spend + State)
#we can write this same as it is
regressor =lm(formula = Profit ~ .,
              data = training_set)
y_predict=predict(regressor,newdata=test_set)
# Building the optimal model using Backward Elimination
regressor =lm(formula = Profit ~ R.D.Spend+ Administration + Marketing.Spend + State,
              data = dataset)
summary(regressor)
regressor =lm(formula = Profit ~ R.D.Spend+ Administration + Marketing.Spend ,
              data = dataset)
summary(regressor)
regressor =lm(formula = Profit ~ R.D.Spend+ Marketing.Spend ,
              data = dataset)
summary(regressor)
regressor =lm(formula = Profit ~ R.D.Spend ,
              data = dataset)
summary(regressor)
