library(plyr)

require(rCharts)
# Define a server for the Shiny 
shinyServer(function(input, output) {
  
  # Use a Reactive Expression to CALCULATE the Percentage of each age group for the selected state
  # Create new column to show in tabular view and in bar chart
  pctInput= reactive ({
                       data=subset(df,Entidad == input$state  & Year == as.numeric(input$year))                                              
                       mutate(data,Pcthab=round((Numhab/sum(Numhab)*100),2))
                      })

  
  # Create an nPlot to show in the Plot tab
  output$statePlot <- renderChart({
    
    # Render a nPlot char using the reactive calculated data
  
    p=nPlot(Pcthab ~ Indicador,
              group='Entidad',            
              data=pctInput(),
              type='multiBarChart',dom='statePlot')
    p$chart(color=c("red","green","yellow"))    
    p$yAxis(axisLabel="Age Group Percentage",width=50)
    p$chart(forceY=c(0,100))
    return(p)
    
  }) #End renderChart
  #Print out the Reactive calculated table to clarify chart
  output$tab1 = renderDataTable(pctInput(), options = list(pageLength = 3))
  
})