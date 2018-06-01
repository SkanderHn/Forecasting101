#Call the necessary libraries 
library('ggplot2') #Graphics library 
library('forecast') #Rob Hynhdman's Forecasting libabry - inclues most standard forecasting methods
library(zoo) # 1.7-10 or higher required
library(scales)
theme_set(theme_bw())

#load the airpassengers data 
data("AirPassengers") 

#Split the data into test and train 
train <- window(AirPassengers, end = c(1957, 12))
test <- window(AirPassengers, start = c(1958, 1), end = c(1959,12))


#Fit the model 
fit <- hw(train ,  h = 25 , seasonal = c("multiplicative") ,level = c (0,0))
#fit <- ses(train , alpha = 0.1 , level = c (0,0))

#Generate forecasts 
tes_fct <- forecast(fit)

#Plot results 
autoplot(tes_fct , ylab = 'Passengers') + scale_x_yearmon() + autolayer(test, series="Data") +
  autolayer(tes_fct$mean, series="Forecasts")


