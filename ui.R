
# Define the overall UI
shinyUI(
  
  # Use tabPanel layout
  navbarPage("Age groups by State",
             tabPanel("Plot",
                      
                      # Give the page a title
                      titlePanel("Percentage of Age Groups per State"),
                      
                      # Generate a sidebar for the choices
                      sidebarLayout(      
                        
                        # Define the sidebar with two inputs
                        # PullBar for States and Slider for Year
                        sidebarPanel(
                          selectInput("state", "State (MX):",                                      
                                      stateChoices
                          ),
                          sliderInput("year","Year",
                                      min=1990,
                                      max=2010,
                                      value=1990,
                                      step=5
                          ),
                          hr(),
                          helpText("Data from INEGI http://www.inegi.org.mx"),
                          hr(),
                          helpText("Please check the About tab for instructions")
                        ),                        
                        # Create the rChart placeholder
                        mainPanel(                          
                          showOutput("statePlot","nvd3")  
                        ) #end mainPanel
                        
                      ),#end SideBarLayout
                      # Show the table data source below the Plot
                      dataTableOutput('tab1')      
             ), #end tabPanel Plot             
             tabPanel("About",
                      headerPanel("Instructions"),
                      sidebarPanel(
                        h5('Information for Mexico (1990-2010)'),
                        hr(),
                        h5(' Sourced from http://www.inegi.org.mx')
                      ),#end sidebarPanel
                      mainPanel(
                        p('This app will plot the average distribution of group ages by Mexican state.'),
                        p(),
                        p('On the plot panel, from the drop box, please select the Mexican State you want to analyze'),
                        p('You can select Nacional if you want to display country wide information.'),
                        p(),
                        p('Data is available for years 1990, 1995, 2000, 2005 and 2010.'),
                        p('Use the slider tool to select the year you want to display.'),
                        p(),
                        p('The table shown below the plot, dispalys the data used in the chart.'),
                        p('Porcentage information is calculated using a reactive function'),
                        p(),
                        p('About the Data:'),
                        p('Age groups represent Theoretically Productive ages (15-59)'),
                        p('and Theoretically Non-Productive ages (0-14 and 60 and beyod)')
                      ) #end mainpanel
                      
             )#end tabPanel "Summary"
             
  )#end navbarPage
)#end ShinyUI