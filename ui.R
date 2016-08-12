library(shiny)

shinyUI(fluidPage(
  titlePanel("Principal Component Analyis and Cluster Heatmap"),
  sidebarLayout(
      ## sidebar panel
      sidebarPanel(
          ## Controls
          h3("Controls"),
          sliderInput("fc1", 
                      "Red samples: log fold change for 20 genes", 
                      min = -10,
                      max = 10,
                      value = 0),
          sliderInput("fc2", 
                      "Green samples: log fold change for 20 genes", 
                      min = -10,
                      max = 10,
                      value = 0),
          sliderInput("fc3", 
                      "Blue samples: log fold change for 20 genes", 
                      min = -10,
                      max = 10,
                      value = 0),
          sliderInput("fc4", 
                      "Red and green samples: log fold change for 20 genes", 
                      min = -10,
                      max = 10,
                      value = 0),
          helpText("The controls allow to adjust different differences in the log fold changes between the red, green, and blue samples."),
          hr(),
          ## Dependencies
          h3("Dependencies"),
          p("The following R packages are needed for the shiny app."),
          code('install.packages("shiny")'),
          br(),
          code('install.packages("mvtnorm")'), 
          br(),
          code('install.packages("scatterplot3d")'), 
          br(),
          code('install.packages("gplots")'), 
          hr()
          ## References
          ## h3("References"),
          ## p("Cui X and Churchill GA (2003). 'Statistical tests for differential expression in cDNA microarray experiments'. Genome Biology, 4(4), 210.")
      ),
      ## main panel
      mainPanel(
          h4("Principle component plot of the first three components"),
          plotOutput("plots", height = "400px"),
          br(),
          h4("Cluster heatmap"),
          plotOutput("plots2", height = "400px")
      )
  )
))
