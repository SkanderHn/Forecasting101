#Call the necessary libraries 
library('ggplot2') #Graphics library 
library('forecast') #Rob Hynhdman's Forecasting libabry - inclues most standard forecasting methods
library(zoo) # 1.7-10 or higher required
library(scales)
theme_set(theme_bw())

#load the airpassengers data 
data("AirPassengers") 

#Split the data into test and train 
train <- window(AirPassengers, end = c(1955, 12))
test <- window(AirPassengers, start = c(1956, 1), end = c(1957,12))


#Fit the model 
fit <- holt(train ,  h = 25 , exponential = TRUE , level = c (0,0))
#fit <- ses(train , alpha = 0.1 , level = c (0,0))

#Generate forecasts 
des_fct <- forecast(fit)

#Plot results 
autoplot(des_fct , ylab = 'Passengers') + scale_x_yearmon() + autolayer(test, series="Data") +
  autolayer(des_fct$mean, series="Forecasts")


