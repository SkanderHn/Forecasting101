#Call the necessary libraries 
library('ggplot2') #Graphics library 
library('forecast') #Rob Hynhdman's Forecasting libabry - inclues most standard forecasting methods

#load the airpassengers data 
data("AirPassengers") 


# Plot the data
autoplot(AirPassengers)

#Split the data into components 
decomp <- stl(AirPassengers , s.window="periodic")

#Plot components 
autoplot(decomp)

