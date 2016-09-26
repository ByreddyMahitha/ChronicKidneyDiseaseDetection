
install.packages("caret")
install.packages("caTools")
install.packages("ROCR")
install.packages("class")
install.packages("MASS")
install.packages("e1071")
install.packages("rpart")
install.packages("rpart.plot")

install.packages("party")
install.packages("kernlab")
install.packages("neuralnet")





library(caret)
library(caTools)
library(ROCR)
library(class)
library(MASS)
library(e1071)
library(rpart)
library(rpart.plot)


library(party)
library(kernlab)
library(neuralnet)


ModelData <- read.csv("CKD Screening Data for Model Building.csv")
TestData <- read.csv("CKD Screening Data for Testing.csv")

ModelData$ID <- NULL
TestData$ID <- NULL

ModelData$X <- NULL
TestData$X <- NULL

ModelData<-ModelData[-5934,] #Bad row. VERY bad row

ModelData <- na.omit(ModelData)
TestData <- na.omit(TestData)

ModelData$Racegrp <- droplevels(ModelData$Racegrp)
ModelData$CareSource <- droplevels(ModelData$CareSource)

TestData$Racegrp <- droplevels(TestData$Racegrp)
TestData$CareSource <- droplevels(TestData$CareSource)

levels(ModelData$Racegrp) <- levels(TestData$Racegrp)
levels(TestData$CareSource) <- levels(ModelData$CareSource)


#Keep separate copy of datasets, start factorizing variables in new copies
ModelDataFactored <- ModelData
TestDataFactored <- TestData

source("Model-Factorize.R")
source("Test-Factorize.R")




source("SVM.R")


source("NaiveBayes.R")


source("NeuralNet.R")