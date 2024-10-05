#Constructing Benchmark Model : ################################################

###Simple Moving Average (SMA): Building #######################################
# Function to calculate SMA
sma <- function(x, y = length(x), h) {
  # Create a vector to store SMA values
  sma_values <- rep(NA, h)

# Calculate SMA for each data point
  for (i in 1:h) {
    sma_values[i] <- mean(x[(length(x)-h+1):length(x)])
    x <- c(x,sma_values[i])
  }
  return(sma_values)
}

###Simple Moving Average (SMA): Forecast #######################################
# Apply the SMA function to your training data
elec_sma <- sma(elec.train, h = 12)
elec_sma 

# Extract the forecasted values
elec_forecast <- ts(elec_sma, frequency=12,start=c(1988, 9))
elec_forecast


###Simple Moving Average (SMA): Accuracy Check #################################
# Calculate RMSE, MAE, and MAPE manually
rmse <- sqrt(mean((elec_forecast - elec.test)^2))
mae <- mean(abs(elec_forecast - elec.test))
mape <- mean(abs((elec_forecast - elec.test) / elec.test)) * 100

# Print the results
cat("RMSE:", rmse,"\nMAE:", mae,"\nMAPE:", mape)


