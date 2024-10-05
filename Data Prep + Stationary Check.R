#importing libraries & Setting Directories######################################
library(fpp2)
library(urca)

setwd("C:/Users/Salim/Personal_Projects/elec_proj")

#Reading and preparing the data#################################################
elec_df <- ts(scan("C:/Users/Salim/Personal_Projects/elec_proj"), frequency=12,start=c(2006,1))
elec_df

###creating training and test data sets #########################################
elec.train <- window(elec_df,start=c(2006,1),end=c(2022,8))
elec.test <- window(elec_df,start=c(2022,9),end=c(2023,8))

###Checking for missing values ##################################################
#No missing values in the train
print(paste("number_of_missing_values:", sum(is.na(elec.train)))) 
#No missing values in the train
print(paste("number_of_missing_values:", sum(is.na(elec.test))))


#Step 1:Data Diagnosis #########################################################

#Determining if a difference of the training data is recommended.
autoplot(elec_df)
nsdiffs(elec.train) 

diff_elec <- diff(elec,1)
autoplot(diff_elec)
#diff_elec looks flat and relatively quickly turning around zero

#Step 2:Test for stationarity ##################################################

##For (elec data)###############################################################
#Dickey-Fuller test result.
elec.df.ur3 <- ur.df(elec,type=c("trend"),selectlags = c("BIC"))
summary(elec.df.ur3)

#KPSS test result
elec.kpss.ur2 <- ur.kpss(elec,type=c("tau"))
summary(elec.kpss.ur2)

##elec data is Stationary from both ADF and KPSS test, So we don't need to difference