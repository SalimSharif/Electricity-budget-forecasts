##Method: Simple Expo (ses)#####################################################           
# Simple Exponential Smoother ses (Assume No Trend, No Seasonality)
fc1 <- ses(elec.train,h=12)  

#accuracy
accuracy(fc1,elec.test)

##Method: Holt Linear Trend (holt)##############################################
# Holt's Linear Trend Method holt(Assume Trend, No Seasonality)
fc2 <- holt(elec.train,h=12)

#accuracy
accuracy(fc2,elec.test)

##Method: Holt Linear Trend (damped)############################################
# Holt's Damped Linear Trend Method (Damped Trend, #No Seasonality)
fc3 <- holt(elec.train,damped=TRUE,h=12)

#accuracy
accuracy(fc3,elec.test)

##Method: Holt-Winters (hw) Additive Seasonal###################################
# Holt-Winter's Additive Seasonal Method (Trend, Additive, # Seasonality)
fc4 <- hw(elec.train,seasonal="additive",h=12)

#accuracy
accuracy(fc4,elec.test)

##Method: Holt-Winters’ Additive Seasonal(damped)###############################
# Holt-Winter's Additive Seasonal Method with Damping (Damped Trend, Additive Seasonality)
fc5 <- hw(elec.train,seasonal="additive",damped=TRUE,h=12)

#accuracy
accuracy(fc5,elec.test)

##Method: Holt-Winters’ Multiplicative Seasonal#################################
# Holt-Winter's Multiplicative Seasonal Method (Trend, #Multiplicative Seasonality)
fc6 <- hw(elec.train,seasonal="multiplicative",h=12)

#accuracy
accuracy(fc6,elec.test)

##Method: Holt-Winters’ Multiplicative Seasonal(damped)#########################
# Holt-Winter's Multiplicative Seasonal Method with Damping#(Trend, Multiplicative Seasonality)
fc7 <- hw(elec.train,seasonal="multiplicative",damped=TRUE,h=12)

#accuracy
accuracy(fc7,elec.test)

##Method: Exponential Smooting ETS(ZZZ) #############################################################
# Here model=("ZZZ") is assumed if the model option is not #specified.
fc8 <- ets(elec.train,model=("ZZZ"))

#accuracy
fct_ets <- forecast(fc8,h=12)
accuracy(fct_ets,elec.test) 