#Evaluating various ARIMA models################################################

##Model 1: Arima d=0, D=0#######################################################
Model_1 <- auto.arima(elec.train,d=0,D=0,trace=TRUE)
summary(Model_1)

#accuracy
fcst_Model1<-forecast(Model_1)
accuracy(fcst_Model1,elec.test)

##Model 2: Arima d=1, D=0#######################################################
Model_2 <- auto.arima(elec.train,d=1,D=0,trace=TRUE)
summary(Model_2)

#accuracy
fcst_Model2<-forecast(Model_2)
accuracy(fcst_Model2,elec.test)

##Model 3: Arima d=1, D=1 ######################################################
Model_3 <- auto.arima(elec.train,d=1,D=1,trace=TRUE)
summary(Model_3)

#accuracy
fcst_Model3<-forecast(Model_3)
accuracy(fcst_Model3,elec.test)

##Model 4: Arima model d=?, D=?#################################################
Model_4 <- auto.arima(elec.train)
summary(Model_4)

#accuracy
fcst_Model4<-forecast(Model_4)
accuracy(fcst_Model4,elec.test)

##Model 5: Airline model  ######################################################

Model_5<- Arima(elec.train,order=c(0,1,1),seasonal=c(0,1,1))
summary(Model_5)

#accuracy
fcst_Model5<-forecast(Model_5)
accuracy(fcst_Model5,elec.test)