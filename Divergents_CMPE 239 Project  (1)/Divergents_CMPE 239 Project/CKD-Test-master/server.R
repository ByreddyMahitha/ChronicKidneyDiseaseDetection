library(shiny)
set.seed(0402)

# Define server logic required to draw a histogram



  shinyServer(function(input,output,session)
    {
   
      output$myPlot<-renderPlot({
        gen<-input$attribute
        ken<-input$Distribution
        if(ken=='training')
        {
          
          training<-read.csv(file="CKD Screening Data for Model Building.csv",head=TRUE)
          matplot(training[, 1], training[, -1], type="h",xlab="all attributes",ylab="CKD",main="distribution of training set")
          
        }
        if(ken=='testing'){
          testing<-read.csv(file="CKD Screening Data for Testing.csv",head=TRUE)
          matplot(testing[, 1], testing[, -1], type="h",xlab="all attributes",ylab="CKD",main="distribution of testing set")
          
        }
        if(ken=='naiveBayes'){
          wn<-read.csv(file="NaiveBayes.csv",head=TRUE)
          matplot(wn[, 1], wn[, -1], type="p",xlab="all attributes",ylab="CKD",main="distribution of Naive bayes set")
          
          
        }
        if(ken=='SVM_Linear'){
          wl<-read.csv(file="SVM_Linear.csv",head=TRUE)
          matplot(wl[, 1], wl[, -1], type="h",col="red",xlab="all attributes",ylab="CKD",main="distribution of SVM_Linear set")
          
        }
        if(ken=='SVM_Radial'){
          wr<-read.csv(file="SVM_Radial.csv",head=TRUE)
          matplot(wr[, 1], wr[, -1], type="s",xlab="all attributes",ylab="CKD",main="distribution of SVM_Radial set")
          
        }
        if(ken=='SVM_Polynomial'){
          wp<-read.csv(file="SVM_Polynomial.csv",head=TRUE)
          matplot(wp[, 1], wp[, -1], type="S",xlab="all attributes",ylab="CKD",main="distribution of SVM_Polynomial set")
          
        }
        if(ken=='SVM_Sigmoid'){
          ws<-read.csv(file="SVM_Sigmoid.csv",head=TRUE)
          matplot(ws[, 1], ws[, -1], col="blue",type="h",xlab="all attributes",ylab="CKD",main="distribution of SVM_Sigmoid set")
          
        }
        if(ken=='NeuralNet'){
          
          
          wnn<-read.csv(file="NeuralNet.csv",head=TRUE)
          matplot(wnn[, 1], wnn[, -1],type="h",xlab="all attributes",ylab="CKD",main="distribution of NeuralNet set")
          
          
          
        }
        
        if(gen=='Female'){
          x<-data.frame("",input$Age,input$Gender)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
         
          plot(CKD~Female,data=training)
         
          
        }
        if(gen=='Age'){
          x<-data.frame("",input$Age)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          features<-c(age=input$Age,female=input$Insured)
         source("NaiveBayes.R")
          plot(CKD~Age,data=training)
          
        }
        if(gen=='RaceGrp')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~Racegrp,data=training)
          
        }
        if(gen=='Educ')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          
          source("NaiveBayes.R")
          plot(CKD~Educ,data=training)
          
        }
        if(gen=='Unmarried')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
         
          source("NaiveBayes.R")
          plot(CKD~Unmarried,data=training)
          
        }
        if(gen=='Income')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          
          source("NaiveBayes.R")
          plot(CKD~Income,data=training)
          
        }
        if(gen=='CareSource')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          
          source("NaiveBayes.R")
          plot(CKD~CareSource,data=training)
          
        }
        if(gen=='Insured')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~Insured,data=training)
          
        }
        if(gen=='Weight')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~Weight,data=training)
          
        }
        if(gen=='Height')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~Height,data=training)
          
        }
        if(gen=='BMI')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~BMI,data=training)
          
        }
        if(gen=='Obese')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~Obese,data=training)
          
        }
        if(gen=='Waist')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~Waist,data=training)
          
        }
        if(gen=='SBP')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP)
      
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~SBP,data=training)
          
        }
        if(gen=='DBP')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP)
      
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~DBP,data=training)
          
        }
        if(gen=='HDL')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP,input$HDL)
      
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~HDL,data=training)
          
        }
        if(gen=='LDL')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP,input$HDL,input$LDL)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~LDL,data=training)
          
        }
        if(gen=='Dyslipidemia')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP,input$HDL,input$LDL,input$Dyslipidemia)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~Dyslipidemia,data=training)
          
        }
        if(gen=='PVD')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP,input$HDL,input$LDL,input$Dyslipidemia,input$PVD)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~PVD,data=training)
          
        }
        if(gen=='Activity')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP,input$HDL,input$LDL,input$Dyslipidemia,input$PVD,input$Activity)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~Activity,data=training)
          
        }
        if(gen=='PoorVision')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP,input$HDL,input$LDL,input$Dyslipidemia,input$PVD,input$Activity,input$Poorvision)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~PoorVision,data=training)
          
        }
        if(gen=='Smoker')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP,input$HDL,input$LDL,input$Dyslipidemia,input$PVD,input$Activity,input$Poorvision,input$Smoker)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~Smoker,data=training)
          
        }
        if(gen=='Hypertension')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP,input$HDL,input$LDL,input$Dyslipidemia,input$PVD,input$Activity,input$Poorvision,input$Smoker,input$hypertension)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~Hypertension,data=training)
          
        }
        if(gen=='Diabetes')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP,input$HDL,input$LDL,input$Dyslipidemia,input$PVD,input$Activity,input$Poorvision,input$Smoker,input$hypertension,"",input$Diabetes)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~Diabetes,data=training)
          
        }
        if(gen=='Stroke')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP,input$HDL,input$LDL,input$Dyslipidemia,input$PVD,input$Activity,input$Poorvision,input$Smoker,input$hypertension,"",input$Diabetes,"",input$Stroke)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~Stroke,data=training)
          
        }
        if(gen=='CVD')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP,input$HDL,input$LDL,input$Dyslipidemia,input$PVD,input$Activity,input$Poorvision,input$Smoker,input$hypertension,"",input$Diabetes,"",input$Stroke,input$CVD)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~CVD,data=training)
          
        }
        if(gen=='CHF')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP,input$HDL,input$LDL,input$Dyslipidemia,input$PVD,input$Activity,input$Poorvision,input$Smoker,input$hypertension,"",input$Diabetes,"",input$Stroke,input$CVD,"",input$CHF)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~CHF,data=training)
          
        }
        if(gen=='Anaemia')
        {
          x<-data.frame("",input$Age ,input$Gender,input$Racegrp,input$Educ,input$`Marital status`, input$income,input$caresource,input$Insured,input$weight,input$height,input$BMI,input$Obese,input$waist,input$SBP,input$DBP,input$HDL,input$LDL,input$Dyslipidemia,input$PVD,input$Activity,input$Poorvision,input$Smoker,input$hypertension,"",input$Diabetes,"",input$Stroke,input$CVD,"",input$CHF,input$Anaemia)
          write.table(x,file="CKD Screening Data for Model Building.csv",row.names=FALSE,col.names = FALSE,append=TRUE,sep=",",quote=FALSE)
          
          source("NaiveBayes.R")
          plot(CKD~Anemia,data=training)
          
        }
       
       
      })
      
    }
)