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

 BMRcalc <- function(gender, age, weight, height) 
	{
		if (gender == 'Male') BMRResult <- (13.75 * weight) + (5 * height) - (6.76 *age) + 66;
		if (gender == 'Female') BMRResult <- (9.56 * weight) + (1.85 * height) - (4.68 *age) + 655
	return(BMRResult)
	}

shinyServer(
  function(input, output) {
    output$gender <- renderPrint({input$gender})  
    output$age <- renderPrint({input$age})
    output$weight <- renderPrint({input$weight})
    output$height <- renderPrint({input$height})
    output$bmr <- renderPrint({BMRcalc(input$gender, input$age, input$weight, input$height)})	
  }
)