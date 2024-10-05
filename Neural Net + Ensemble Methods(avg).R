#Setting Seed###################################################################
RNGkind(sample.kind = "Rounding")
set.seed(1)

##Model 6: NN model  ###########################################################
Model_6 <- nnetar(elec.train)
Model_6$lags
Model_6$method

#accuracy for NN Model
fcst_Model6<-forecast(Model_6,PI=TRUE)
accuracy(fcst_Model6,elec.test)