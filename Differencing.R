#Call the necessary libraries 
library('ggplot2') #Graphics library 
library('forecast') #Rob Hynhdman's Forecasting libabry - inclues most standard forecasting methods

#load the airpassengers data 
data("AirPassengers") 


# Plot the data
autoplot(AirPassengers)

# Plot the 1st order difference 
autoplot(diff(AirPassengers))

# Plot the 2nd order difference 
autoplot(diff(diff(AirPassengers)))


