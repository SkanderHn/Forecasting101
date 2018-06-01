#Call the necessary libraries 
library('ggplot2') #Graphics library 
library('forecast') #Rob Hynhdman's Forecasting libabry - inclues most standard forecasting methods
library(zoo) # 1.7-10 or higher required - this is used for date formatting 
library(scales) # This is used for formatting the axis on the plots. 
theme_set(theme_bw()) 

#load the airpassengers data 
data("AirPassengers") 

#Split the data into test and train 
train <- window(AirPassengers, end = c(1955, 12))
test <- window(AirPassengers, start = c(1956, 1), end = c(1957,12))


#Fit the model - auto.arima chooses the best regular or seasonal ARIMA model
fit <- auto.arima(train)


#Generate forecasts 
#level = c (0,0) is used to set the forecast intervals to 0 , 
#usually they would be set to 85(%) and 95(%) These are the confidence intervals of the forecast 
#I am setting them to 0 so that they are not displayed for better clarity  
arima_fct <- forecast(fit,level = c (0,0)) 

#Plot results 
autoplot(arima_fct , ylab = 'Passengers') + scale_x_yearmon() + autolayer(test, series="Data") +
  autolayer(arima_fct$mean, series="Forecasts")


