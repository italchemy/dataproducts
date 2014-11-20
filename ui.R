# 
# This is the user-interface definition of the fuel economy estimator application. 
#
# The application accepts inputs for the weight, engine size (in cylinders), and
# horsepower of a vehicle and produces an estimate of the vehicle's fuel economy
# (in miles per U.S. gallon)
# 

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Fuel Economy Estimator"),

  # Sidebar with inputs for model predictors
  sidebarLayout(
    sidebarPanel(
      sliderInput("weight",
                  "Vehicle Weight (lbs):",
                  min = 1000,
                  max = 6000,
                  value = 3000,
                  step = 10,
                  ticks = TRUE),
      selectInput("cylinders",
                  "Cylinders:",
                  choices = c("4","6","8"),
                  multiple = FALSE),
      numericInput("horsepower",
                   "Horsepower:",
                   value = 175,
                   min = 50,
                   max = 400,
                   step=1)
    ),

    # Show the predicted mileage along with the predictor values. Personally,
    # I'm not fond of the level of coupling here (the server is returning
    # partially formatted display string) but I think the solution is to produce
    # my own HTML and that's beyond the scope of this assignment.
    
    mainPanel(
      h3("The estimated mileage is for a vehicle...", align="center"),
      h4(textOutput("weight"), align="center"),
      h4(textOutput("cylinders"), align="center"),
      h4(textOutput("horsepower"), align="center"),      
      h3(textOutput("mpg"), align="center")
    )
  )
))
