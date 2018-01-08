library(shiny)
library(Cairo)
dataset <- read.csv(file = "data.csv", header=T, sep=",")

shinyUI=navbarPage("Predictive Analysis",
                
tabPanel("Data",
           dataTableOutput('contents'),
           hr(),
           list(basicPage(
          renderDataTable('contents')
        ))),
  
tabPanel("Frequency",
         dataTableOutput('Itemcontents'),
         hr(),
         
         list(basicPage(
           renderDataTable('Itemcontents')
         ))
         ),
  
  tabPanel("MFI",
           fluidPage(
             titlePanel("Most Frequent Item"),
             sidebarLayout(
               sidebarPanel(
                 sliderInput(inputId = "top_level",label = "Top Items",min=1,
                             max = 40,value=10), width = 4),
                 mainPanel(plotOutput("ItemGraph"))
               )
             )
           ),
  
  tabPanel("Behaviour",basicPage(plotOutput("svmGraph"))),
  tabPanel("Details",basicPage(
           tabsetPanel(
             tabPanel("Products Relative to Frankfurter",plotOutput("avg")),
             tabPanel("Accuracy",verbatimTextOutput("accuracy_text"))
           )))
)