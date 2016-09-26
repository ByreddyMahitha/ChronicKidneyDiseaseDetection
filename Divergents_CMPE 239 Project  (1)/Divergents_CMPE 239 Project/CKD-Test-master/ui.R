library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  
  pageWithSidebar(
    headerPanel("CKD Prediction"),
    sidebarPanel(
      selectInput("Distribution","please select the data distribution type",
                  choices=c("select","training","testing","naiveBayes","SVM_Linear","SVM_Radial","SVM_Polynomial","SVM_Sigmoid","NeuralNet")),
      
      
     
      selectInput("attribute","please select the attribute",
                  choices=c("select","Age","Female","RaceGrp","Educ","Unmarried","Income","CareSource","Insured","Weight","Height","BMI","Obese","Waist","SBP","DBP","HDL","LDL","Dyslipidemia","PVD","Activity","PoorVision","Smoker","Hypertension","Diabetes","Stroke","CVD","CHF","Anaemia")),
      
      conditionalPanel(condition="input.attribute=='Age'",
                       textInput("Age","please select the Age between 1 and 120:")),
      conditionalPanel(condition="input.attribute=='Female'",
                       textInput("Gender","please select the Gender either male or female:")),
      conditionalPanel(condition="input.attribute=='RaceGrp'",
                       rg<-textInput("Racegrp","please select the Racegrp-white,hispa,black,other:")),
      conditionalPanel(condition="input.attribute=='Educ'",
                       ed<-textInput("Educ","please select the Educ-0(high school or less),1(more than high school):")),
      conditionalPanel(condition="input.attribute=='Unmarried'",
                       unm<-textInput("Marital status","please select the MaritalStatus:-1(unmarried),0(married)")),
      conditionalPanel(condition="input.attribute=='Income'",
                       inc<-textInput("income","please select the Income-1(house hold income is above median),0(house hold income less than median):")),
      conditionalPanel(condition="input.attribute=='CareSource'",
                       cs<-textInput("caresource","please select the Caresource-other,no place, Dr.HMO, clinic:",'clinic')),
      conditionalPanel(condition="input.attribute=='Insured'",
                       ins<-textInput("Insured","please select the insurance status:-1(insured),0(not insured)")),
      conditionalPanel(condition="input.attribute=='Weight'",
                       wt<-textInput("weight","please enter the weight in kgs:")),
      conditionalPanel(condition="input.attribute=='Height'",
                      ht<- textInput("height","please enter the height in cms:")),
      conditionalPanel(condition="input.attribute=='BMI'",
                       BMI<-textInput("BMI","please enter the BMI in kg/m2:")),
      conditionalPanel(condition="input.attribute=='Obese'",
                      obs<- textInput("Obese","please select the obesity in kg/m2-1(if BMI is greater than 30),0(BMI is less than 30):")),
      conditionalPanel(condition="input.attribute=='Waist'",
                       wst<-textInput("waist","please enter the waist in cms:")),
      conditionalPanel(condition="input.attribute=='SBP'",
                      sbp<- textInput("SBP","please enter the SBP:")),
      conditionalPanel(condition="input.attribute=='DBP'",
                       dbp<-textInput("DBP","please enter the DBP:")),
      conditionalPanel(condition="input.attribute=='HDL'",
                       hdl<-textInput("HDL","please enter the HDL:")),
      conditionalPanel(condition="input.attribute=='LDL'",
                       ldl<-textInput("LDL","please enter the LDL:")),
      conditionalPanel(condition="input.attribute=='Dyslipidemia'",
                       dys<-textInput("Dyslipidemia","please select the Dyslipidemia:1(too high LDL or too low HDL),0(otherwise)")),
      conditionalPanel(condition="input.attribute=='PVD'",
                      pvd<- textInput("PVD","please select the PVD:1(reduced SBP),0(otherwise)")),
      conditionalPanel(condition="input.attribute=='Activity'",
                      act<- textInput("Activity","please select the activity-1(mostly sit), 2(stand or walk), 3(lift light loads or climb stairs often), 4(heavy work and heavy loads):")),
      conditionalPanel(condition="input.attribute=='PoorVision'",
                       pv<-textInput("Poorvision","please select the Poorvision-0(no poor vision),1(poor vision):")),
      conditionalPanel(condition="input.attribute=='Smoker'",
                       smk<-textInput("Smoker","please select the smoker-1(atleast 100 ciagarettes),0(otherwise):")),
      conditionalPanel(condition="input.attribute=='Hypertension'",
                       hypt<-textInput("hypertension","please select the hypertension-1(atleast 1 of the four indicators of HBP is present),0(otherwise):")),

      conditionalPanel(condition="input.attribute=='Diabetes'",
                       diab<-textInput("Diabetes","please select the Diabetes-1(if diabetic),0(otherwise):")),
      
      conditionalPanel(condition="input.attribute=='Stroke'",
                       str<-textInput("Stroke","please select the Stroke-1(if you had stroke before),0(otherwise):")),
      conditionalPanel(condition="input.attribute=='CVD'",
                       cvd<-textInput("CVD","please select the CVD-1(if you had angine pectoris,myocardial infarction or stroke),0(otherwise):")),
      
      conditionalPanel(condition="input.attribute=='CHF'",
                       chf<-textInput("CHF","please select the CHF-1(if you had congestive heart failure),0(otherwise):")),
      conditionalPanel(condition="input.attribute=='Anaemia'",
                      anm<- textInput("Anaemia","please select the Anaemia-1(if you received treatment in past 3 months or haemoglobin content is low-lower than 11gm/dL),0(otherwise):"))
      
      
    ),
    mainPanel(
     
      plotOutput("myPlot")
    )
  )
  
)