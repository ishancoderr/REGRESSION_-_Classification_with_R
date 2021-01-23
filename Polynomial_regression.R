dataset=read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

#library(caTools)
#set.seed(1234)
#split=sample.split(dataset$DependentVarible,SplitRatio = 0.8)
#training_set=subset(dataset,split==TRUE)
#test_set=subset(dataset,split==FALSE)

lin_reg = lm(formula = Salary ~.,
             data=dataset)
dataset$Level2=dataset$Level^2
dataset$Level3=dataset$Level^3

poly_reg=lm(formula = Salary~.,
            data = dataset)

library(ggplot2)
#x_grid =seq(min(dataset$Level),max(dataset$Level),0.1)

ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             colour='red')+
  geom_line(aes(x=dataset$Level,y=predict(poly_reg,newdata = dataset)),
             colour='blue')+
  ggtitle('Truth or Bluff (polynomial Regression)')+
  xlab('level')+
  ylab('Salary')

y_pred=predict(lin_reg,data.frame(Level=6.5))
y_pred_1=predict(poly_reg,data.frame(Level=6.5,
                                     Level2=6.5^2,
                                     Level3=6.5^3,
                                     Level4=6.5^4))
  