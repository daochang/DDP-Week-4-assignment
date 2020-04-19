library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict Thrust Generated from Aircraft Weight"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderweight", "What is the Weight of the aircraft (in Kg)?", 
                        5000, 60000, value = 10000),
            h5("Note: Select a value for aircraft weight from the slider input
               on top to get a prediction of thrust generated on the right"),
            submitButton("Submit")
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Thrust from Linear Model (see blue triangle):"),
            textOutput("Prediction"),
        )
    )
))