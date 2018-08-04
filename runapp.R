# Install Shiny
if (!suppressWarnings(require(shiny, quietly=TRUE))) {
  install.packages('shiny', repos = 'http://cran.rstudio.com/')
  library(shiny)
}

setwd("D:\\Winson\\Github\\DEViS\\")

# Create app object (assume ui and server are defined above)
runApp(launch.browser = TRUE)
