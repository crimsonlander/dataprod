
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(caret)
library(randomForest)
library(kernlab)
library(e1071)

shinyServer(function(input, output) {
  data("spam")
  inTrain <- sample(1:nrow(spam), nrow(spam)*0.8)
  
  trainingData <- spam[inTrain,]
  
  testData <- spam[-inTrain,]
  
  getLabels <- reactive({
    model <- randomForest(data=trainingData, type ~ ., ntree = input$ntrees, maxnodes = input$maxnodes)
    labels <- predict(model, testData)
    labels
  })
  
  output$confusionMatrix <- renderPrint({
    confusionMatrix(getLabels(), testData$type)
  })

})
