suppressMessages ({
  library(devtools)
  library(shiny)
  library(shinyjs)   # Shiny json
  library(readxl)    # Read excel files
  library(ggplot2)   # plotting
  library(plotly)    # interactive plots
  library(ggrepel)   # Text for ggplot
  library(scales)    # Color stuff
  library(DT)        # Get data table
  library(tidyr)     # Data transformation
  library(dplyr)     # Data transformation
  library(car)       # Regresion diagnostics
  library(lm.beta)   # Regression stuff
  library(lmSupport) # Regression stuff
  library(sendmailR) # Send E-mail
  library(Hmisc)
  library(quantreg)
  library(markdown)
  library(rlang)
  library(lazyeval)
  devtools::install_github("sachsmc/ggkm")
  library(ggkm)
  devtools::install_github("benjaminrich/table1")
  library(table1)
  
})

source("functions/diagnose_regression.R")
source("functions/RegressionPlots.R")
source("functions/sourceable.R") # Not going to show source code for plot

options(shiny.maxRequestSize=250*1024^2)
#options(shiny.reactlog=TRUE)

stat_sum_df <- function(fun, geom="point", ...) {
  stat_summary(fun.data=fun,  geom=geom,  ...)
}
stat_sum_single <- function(fun, geom="point", ...) {
  stat_summary(fun.y=fun,  geom=geom,  ...)
}

median.n <- function(x){
  return(c(y = ifelse(median(x)<0,median(x),median(x)),
           label = round(median(x),2)))
}
give.n <- function(x){
  return(c(y = min(x)*1,  label = length(x)))
}

tableau10 <- c("#1F77B4","#FF7F0E","#2CA02C","#D62728","#9467BD",
               "#8C564B","#E377C2","#7F7F7F","#BCBD22","#17BECF")

tableau20 <- c("#1F77B4","#AEC7E8", "#FF7F0E","#FFBB78"  ,"#2CA02C",
               "#98DF8A" ,"#D62728","#FF9896" ,"#9467BD","#C5B0D5" ,
               "#8C564B","#C49C94" ,"#E377C2","#F7B6D2" ,"#7F7F7F",
               "#C7C7C7" ,"#BCBD22","#DBDB8D" ,"#17BECF","#9EDAE5")

cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442",
               "#0072B2", "#D55E00", "#CC79A7")
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442",
                "#0072B2", "#D55E00", "#CC79A7")

# All stats that can be displayed for continuous variables
allstats <- c("N",
              "Mean",
              "SD",
              "CV%",
              "Median",
              "Min",
              "Max",
              "IQR",
              "Geo. Mean",
              "Geo. CV%",
              "Mean (SD)",
              "Mean (CV%)",
              "Mean (SD) (CV%)",
              "Median [Min, Max]",
              "Median [IQR]",
              "Geo. Mean (Geo. CV%)")
