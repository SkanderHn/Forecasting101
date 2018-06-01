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


#Generate model 
#level = c (0,0) is used to set the forecast intervals to 0 , 
#usually they would be set to 85(%) and 95(%) These are the confidence intervals of the forecast 
#I am setting them to 0 so that they are not displayed for better clarity 
fit <- holt(train ,  h = 25 , level = c (0,0))


#Generate forecasts 
des_fct <- forecast(fit)

#Plot results 
autoplot(des_fct , ylab = 'Passengers') + scale_x_yearmon() + autolayer(test, series="Data") +
  autolayer(des_fct$mean, series="Forecasts")


