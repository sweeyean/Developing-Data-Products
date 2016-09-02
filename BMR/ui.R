##ui.R

# This is the server logic for a Shiny web application.
# This application calculates your Basal metabolic rate (BMR) based on gender, age, weight and height inputs.
# Based on the Basal metabolic rate (BMR) results, the application will tell the amount of calories that you burn while you are at complete rest and not digesting any food:

#This BMR calculator provides an estimate of your Basal Metabolic Rate (BMR). Your BMR is the the amount of calories that you burn while you are at complete rest and not digesting any food. 
#In other words, BMR represents the amount of calories your body must burn to simply keep itself alive without accomplishing anything else. 
#BMR calories are burned to sustain the function of vital organs like your heart, brain, nervous system, lungs, kidneys, liver, muscles, and skin, 
#but BMR does not include calories burned to support physical activity or digestion of food.

#Equations
#Male (metric): BMR = (13.75 x WKG) + (5 x HC) - (6.76 x age) + 66
#Female (metric): BMR = (9.56 x WKG) + (1.85 x HC) - 4.68 x age) + 655
#HC = Height in Centimetres  
#WKG = Weight in Kilograms 

library(shiny)

shinyUI
  (pageWithSidebar(
    headerPanel("BMR Calculator"),
    sidebarPanel(
     radioButtons('gender', 'Gender', choices = list('Male' = 'Male', 'Female' = 'Female'), selected = 'Male'),
      numericInput('age', 'Your age', 0, min = 0, max = NA, step = 1),	  
      numericInput('weight', 'Your Weight in Kilogram(kg)', 0, min = 0, max = NA, step = 5),
      numericInput('height', 'Your Height in CentiMeter(cm)', 0, min = 10, max = NA, step = 5),
      submitButton('Submit')
    ),
    mainPanel(
      h2('Basal Metabolic Rate Calculator (BMR)'),
      p('This Metric BMI Calculator will calculate your BMR and indicate the amount of calories that you burn while you are at complete rest and not digesting any food.'),
      p('Please enter your gender, age, weight in Kilogram and height in CentiMeter and press "SUBMIT" button.'),      
	  h4('You entered gender:'),
      verbatimTextOutput("gender"),      
	  h4('You entered age:'),
      verbatimTextOutput("age"),
	  h4('You entered weight:'),
      verbatimTextOutput("weight"),
      h4('You entered height:'),
      verbatimTextOutput("height"),
      h4('Your BMR is an estimated calories per day: '),
      verbatimTextOutput("bmr")
    )
  )
)