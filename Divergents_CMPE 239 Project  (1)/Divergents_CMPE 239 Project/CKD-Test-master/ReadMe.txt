In this project we predicted chronic kidney disease using many attrubtes. For this we used different classification algorithms such as SVM, ANN and Naive Bayes.

##Dataset 

Dataset is taken from National Center for Health Statistics. 
http://www.cdc.gov/nchs/nhanes/

##Tools

We used R and then RStudio  
[R] (https://cran.r-project.org/src/base/R-3/) [RStudio] (https://www.rstudio.com/products/rstudio/download/)

##Packages
We need to install some packages for execution
[caret] (install.packages"caret") [caTools] (install.packages"caTools") [ROCR] (install.packages"ROCR")  [class] (install.packages"class") [MASS] (install.packages"MASS") [e1071] (install.packages"e1071")
[rpart] (install.packages"rpart") [rpart.plot] (install.packages"rpart.plot") [rattle] (install.packages"rattle") [party] (install.packages"party") [kernlab] (install.packages"kernlab") [neuralnet] (install.packages"neuralnet")

##UI Components

We used shiny for UI. It is a package in RStudio. Change in outputs w.r.t inputs can be obatained easily by reloading the browser.
Install shiny package using (install.packages"shiny")

##Description 

The training dataset is present in CKD Screening Data For Model Building.csv file
The testing dataset is present in CKD Screening Data For Testing.csv file
The code for the Naive Bayes algorithm is present in NaiveBayes.R
The code for the SVM algorithm is present in SVM.R
The code for the Neural Net algorithm is present in NeuralNet.R
The test file is present in CKD-Test.R

