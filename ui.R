
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(caret)

shinyUI(fluidPage(

  # Application title
  titlePanel("Random forest classification performance on spam dataset"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("ntrees",
                  "Number of trees:",
                  min = 1,
                  max = 100,
                  value = 5),
      sliderInput("maxnodes",
                  "Maximum number of nodes:",
                  min = 1,
                  max = 100,
                  value = 5),
      helpText("This app shows performance of random forest on classification of emails from 'spam' dataset from 'kernlab' package.",
               "You need to choose number of trees and maximum number of nodes in trees.",
               "Random forest is trained on training set, which consists of 80% of the dataset, then tested on the rest of the data.")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      verbatimTextOutput("confusionMatrix")
    )
  )
))
