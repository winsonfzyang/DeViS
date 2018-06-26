# Install Shiny
if (!suppressWarnings(require(shiny, quietly=TRUE))) {
  install.packages('shiny', repos = 'http://cran.rstudio.com/')
  library(shiny)
}

# Run DEViS using runGitHub
runGitHub("DEViS", "winsonfzyang",
          launch.browser = TRUE)
