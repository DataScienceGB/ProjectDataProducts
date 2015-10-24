#Load Main libraries and data

library(shiny)
library(rCharts)

#Read and load data and create segmented dataframes

df=read.csv('poblacion2.csv',na.strings = c(""),stringsAsFactors = F)

#Define selectors
stateChoices=unique(as.character(df$Entidad))

