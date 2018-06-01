#Call the necessary libraries 
library('ggplot2') #Graphics library 
library('forecast') #Rob Hynhdman's Forecasting libabry - inclues most standard forecasting methods
library(zoo) # 1.7-10 or higher required
library(scales)
theme_set(theme_bw())

#load the airpassengers data 
data("AirPassengers") 

#Split the data into test and train 
train <- window(AirPassengers, end = c(1949, 12))
test <- window(AirPassengers, start = c(1950, 1), end = c(1950,5))


#Fit the model 
fit <- naive(train , level = c (0,0))

#Generate forecasts 
naive_fct <- forecast(fit, h=5)

#Plot results 
autoplot(naive_fct , ylab = 'Passengers') + scale_x_yearmon() + autolayer(test, series="Data") +
  autolayer(naive_fct$mean, series="Forecasts")


