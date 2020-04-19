library(shiny)
shinyServer(function(input, output) {
    library(robustbase)
    data(aircraft, package="robustbase")
    DF<-aircraft
    colnames(DF) <- c("Aspect Ratio", "Lift-to-drag Ratio",
                      "Weight", "Thrust", "Cost")
    model <- lm(Thrust ~ Weight, data = DF)
  
    
    modelpred <- reactive({
        WeightInput <- input$sliderweight
        predict(model, newdata = data.frame(Weight = WeightInput))
    })
    
    
    output$plot1 <- renderPlot({
        WeightInput <- input$sliderweight
        
        plot(DF$Weight, DF$Thrust, xlab = "Aircraft Weight", 
             ylab = "Thrust Generated", bty = "n", pch = 16,
             xlim = c(0, 60000), ylim = c(0, 70000))
        points(WeightInput, modelpred(), col = "blue", pch=17, cex=1.5)
    })
    
    output$Prediction <- renderText({
        modelpred()
    })
    
    
})