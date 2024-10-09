library(shiny)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
  
  # Application title
  titlePanel("Dynamic Ploygon Creation"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("Radius",
                  "Varyig Radius:",
                  min = 1,
                  max = 5,
                  value = 2),
      sliderInput("Sides",
                  "Number of Sides:",
                  min = 1,
                  max = 20,
                  value = 3)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("Polyplot")
    )
  )
))


server <- shinyServer(function(input, output){
  
  output$Polyplot <- renderPlot({
    
    N=input$Radius
    M=input$Sides
    x=c()
    y=c()
    plot(c(-15,15), c(-15,15), type="n", asp=1)
    for(n in seq(1,M, 1)){
      x[n] =N * cos(2*pi*(n/M))
      y[n]= N * sin(2*pi*(n/M))
    }
    return(lines(x= c(x,x[1]),y = c(y,y[1])))
  })
})

# Run the application 
shinyApp(ui = ui, server = server)
