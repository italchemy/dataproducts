#
# This is the server logic for the fuel economy estimator application. The
# application accepts three inputs: the vehicle weight (in pounds), the number
# of engine cylinders, and the horsepower for a vehicle. The application returns
# an estimate of the vehicle's fuel economy in miles per U.S. gallon of fuel.
# 

library(shiny)
library(datasets)

# 
# Build the estimating model. This doesn't depend on user inputs so we'll only
# build the model once and re-use it across server invocations.
# 

cars <- mtcars
cars$cyl <- as.factor(cars$cyl)
mpgModel <- lm(mpg ~ wt+cyl+hp, data = cars)

# The shiny server function

shinyServer(function(input, output) {
  
  # Echo input values
  output$weight <- renderText(paste("weighing", input$weight, "pounds,"))
  output$cylinders <- renderText(paste("with", input$cylinders, "cylinders, and"))
  output$horsepower <- renderText(paste(input$horsepower, "horespower, is"))
  
  # Calculate the fuel economy prediction
  output$mpg <- renderText(predict(mpgModel, 
                                   data.frame(wt=input$weight/1000, 
                                              cyl=input$cylinders,
                                              hp=input$horsepower)))
  
})
